@include('header')

<center>
<h1>{{$event->title}} - {{$event->date}}</h1>
<h2>{{$location->name}}</h2>
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

@include('footer')
