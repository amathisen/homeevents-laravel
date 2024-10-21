@include('header')

<center><h1>{{$activity_object->name}}</h1></center>
<br>
<b>Games Played:</b> {{count($event_activities_results_objects)}}<br>
<b>Average Placement:</b> {{(array_sum($results_values) / count($event_activities_results_objects))}}<br>
<br><hr><br>
<table>
@foreach($events as $this_event)
    <tr>
        <td>{{$this_event->date}}</td>
        <td>{!!$this_event->get_href();!!}</td>
        <td>{{$this_event->event_activities_name}}</td>
        <td>{{$this_event->event_activities_results_result_value}}</td>
    </tr>
@endforeach
</table>

@include('footer')
