@include('header') 

<center>
<h1>{{$group->name}}</h1>
<h2>{{$group->description}}</h2>
</center>

<table class="block">
    <tr>
        <td class="title">User</td>
        <td class="title">Role</td>
    </tr>
@foreach($group->get_ref_values('users_groups') as $this_group)
    <tr>
        <td>{!!get_href_by_type_and_id('users',$this_group['users_id']);!!}</td>
        <td>{{get_value_by_type_and_id('roles_groups',$this_group['roles_groups_id'],'name')['name']}}</td>
    </tr>
@endforeach
</table>
@if(count($leaderboards))
<!-- Begin Leaderboards Block -->
    <br><hr><br>
    <h1>Leaderboards</h1>
    @foreach($leaderboards as $this_leaderboard)
        {{$this_leaderboard->show()}}
        <br><br>
    @endforeach
<!-- End Leaderboards Block -->
@endif
<br><hr><br>
<table>
<tr><td class="title" colspan="3">Events</td></tr>
@foreach($group->get_ref_values('event') as $this_event)
    <tr>
        <td class="indent">{!!get_href_by_type_and_id('location',$this_event['location_id']);!!}</td>
        <td>{!!get_href_by_type_and_id('event',$this_event['id']);!!}</td>
        <td>{{date_display($this_event['date']);}}</td>
    </tr>
@endforeach
</table>

@if(user_has_role(ROLEIDS["ADMIN"]) || user_has_group_role($group->id,GROUPROLEIDS["ADMIN"]) || user_has_group_role($group->id,GROUPROLEIDS["CREATOR"]))
<!-- Begin Add Event -->
<br><hr><br>
<table>
<form method="post" action="/objects/crud">
    @csrf
    <input type="hidden" name="object_type" value="event">
    <input type="hidden" name="groups_id" value="{{$group->id}}">
    <input type="hidden" name="redirect_to" value="/event/NEWID">
    <tr><td class="title" colspan="3">Add Event</td></tr>
    <tr>
        <td class="indent">Title</td>
        <td>{!!$event->write_form_field("title",editable:true)[1]!!}</td>
    </tr>
    <tr>
        <td class="indent">Location</td>
        <td>{!!$event->write_form_field("location_id",editable:true)[1]!!}</td>
    </tr>
    <tr>
        <td class="indent">Date</td>
        <td>{!!$event->write_form_field("date",editable:true)[1]!!}</td>
    </tr>
    <tr>
        <td colspan="2"><input type="submit" value="Create"></td>
    </tr>
</form>
</table>
<!-- End Add Event -->
@endif

@include('footer') 
