@include('header')

<center>
<h1>{{$activity_object->name}}</h1>
<h2>By @foreach($users as $this_user) {!!$this_user->get_href()!!} @endforeach</h2>
</center>
<br>
<b>Games Played:</b> {{count($event_activities_results_objects)}}<br>
<b>Average Placement:</b> {{(array_sum($results_values) / count($event_activities_results_objects))}}
<br>
<table class="block">
@foreach($scores as $key => $value)
    <tr>
        <td class="indent title">{{$key}} Place</td>
        <td>{{$value}}</td>
    </tr>
@endforeach
</table>
<br>
@foreach($scores_opponents as $these_scores)
<table class="block">
    <tr>
        <td class="title" colspan="2">
        @if(isset($these_scores['title']))
            {!!$these_scores['title']!!}
        @else
            {{$activity_object->name}}
        @endif
        @if(isset($these_scores['average_placement']))
            - Average Placement: {!!$these_scores['average_placement']!!}
        @endif
        </td>
    </tr>
    @foreach($these_scores as $key => $value)
        @continue($key == 'title' || $key == 'average_placement')
        <tr>
            <td class="indent">{{$key}} Place</td>
            <td>{{$value}} time(s)</td>
        </tr>
    @endforeach
</table>
@if(!isset($these_scores['title']))
    <br>
@endif
@endforeach

<br><hr><br>

<table class="block">
@foreach($events as $this_event)
    <tr>
        <td>{{date_display($this_event->date);}}</td>
        <td>{!!$this_event->get_href();!!}</td>
        <td>{{$this_event->event_activities_name}}</td>
        <td>{{$this_event->event_activities_results_result_value}} Place</td>
    </tr>
@endforeach
</table>

@include('footer')
