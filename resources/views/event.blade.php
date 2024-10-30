@include('header')

<center>
<h1>{{$event->title}} - {{date_display($event->date);}}</h1>
<h2>{!!get_href_by_type_and_id('location',$event->location_id)!!}</h2>
<h3>@foreach($users as $this_user) {!!$this_user->get_href()!!}@endforeach</h3>
</center>
<br><br>
@foreach($activity_block as $this_activity)
    {{$this_activity[0]}} - {{$this_activity[1]}}<br>
    <table class="block">
    @foreach(array_slice($this_activity,2) as $this_activity_display)
        <tr>
            <td>{!!$this_activity_display['display_name']!!}</td>
            <td>{{$this_activity_display['score_value']}}</td>
        </tr>
    @endforeach
    </table>
    <br>
@endforeach

@if(user_has_role(ROLEIDS["ADMIN"]))
<!-- Begin Event Admin Tools -->
    <br>
    <hr>
    <br>

    @if(count($missing_users))
    <!-- Begin Add Missing User -->
        <form method="post" action="/objects/crud">
            @csrf
            <input type="hidden" name="object_type" value="event_users">
            <input type="hidden" name="event_id" value="{{$event->id}}">
            <input type="hidden" name="redirect_to" value="/event/{{$event->id}}">
            <input type="hidden" name="groups_id" value="{{$event->groups_id}}">
            <select name="users_id" id="users_id">
                @foreach($missing_users as $this_user)
                    <option value="{{$this_user->id}}">{{$this_user->name}}</option>
                @endforeach
            </select>
            <input type="submit" value="Add User">
        </form>
    <br>
    <br>
    <!-- End Add Missing User -->
    @endif

    @if(count($activities))
    <!-- Begin Add Activity -->
        <form method="post" action="/objects/crud">
            @csrf
            <input type="hidden" name="object_type" value="event_activities">
            <input type="hidden" name="event_id" value="{{$event->id}}">
            <input type="hidden" name="redirect_to" value="/event/{{$event->id}}">
            <input type="hidden" name="groups_id" value="{{$event->groups_id}}">
            <input type="text" name="name" id="name">
            <select name="activity_id" id="activity_id">
                @foreach($activities as $this_activity)
                    <option value="{{$this_activity->id}}">{{$this_activity->name}}</option>
                @endforeach
            </select>
            <input type="submit" value="Add Activity">
        </form>
    <!-- End Add Activity -->
    @endif

    @if(count($missing_results))
    <!-- Begin Add Missing Results -->
    <br>
    <hr>
    <br>
    <h2>Missing Results</h2>
    Hide Mulligan <input type='checkbox' onchange='change_visibility("activity_id_{{MULLIGANID}}_row")'>
    <br>
    <table class="block">
        @foreach($missing_results as $this_result)
            <tr class="activity_id_{{$this_result['activity_id']}}_row">
                <td>{{$this_result['event_activities_name']}}</td>
                <td>{{$this_result['activity_name']}}</td>
                <td>{{$this_result['users_name']}}</td>
                <td>
                    <form method="post" action="/objects/crud">
                        @csrf
                        <input type="hidden" name="object_type" value="event_activities_results">
                        <input type="hidden" name="event_activities_id" value="{{$this_result['event_activities_id']}}">
                        <input type="hidden" name="users_id" value="{{$this_result['users_id']}}">
                        <input type="hidden" name="redirect_to" value="/event/{{$event->id}}">
                        <input type="hidden" name="groups_id" value="{{$event->groups_id}}">
                        @if(isset($this_result['activity_object_type_id']))
                            <input type="hidden" name="RECURSIVE_PREVIOUSIDTOFIELD" value="event_activities_results_id">
                            <input type="hidden" name="RECURSIVE_OBJECTTYPE" value="event_activities_results_objects">
                            <input type="hidden" name="RECURSIVE_groups_id" value="{{$event->groups_id}}">
                            <select name="RECURSIVE_activity_object_id" id="RECURSIVE_activity_object_id">
                                @foreach($activity_objects as $this_activity_object)
                                    @if($this_result['activity_object_type_id'] == $this_activity_object->activity_object_type_id)
                                        <option value="{{$this_activity_object->id}}">{{$this_activity_object->name}}</option>
                                    @endif
                                @endforeach
                            </select>
                        @endif
                        <input type="text" name="result_value" id="result_value">
                        <input type="submit" value="Add Result">
                    </form>
                </td>
            </tr>
        @endforeach
    </table>
    <!-- End Add Missing Results -->
    @endif
<!-- End Event Admin Tools -->
@endif

@include('footer')
