@include('header') 

<center><h1>{{$user->name}}</h1></center>
<br>
<b>Events Attended:</b> {{count($events);}}
<br>
<br>
@foreach($results_block as $this_result_group)
    @foreach($this_result_group as $this_result_stack)
        <table>
            <tr>
                <td colspan="2" class="title">{!!$this_result_stack[0]!!}</td>
            </tr>
            @foreach(array_slice($this_result_stack,1) as $this_result_display)
                <tr>
                    <td class="indent">{{$this_result_display[0]}}<td>
                    <td>{{$this_result_display[1]}}</td>
                </tr>
            @endforeach
        </table>
        <br>
    @endforeach
    <br><hr><br>
@endforeach
<br>
@foreach($events as $this_event)
    <table class="block">
        <tr>
            <td colspan="3" class="title">{!!$this_event->get_href()!!} {{date_display($this_event->date);}}</td>
        </tr>
        @foreach($this_event->activity_details as $this_activity)
            <tr>
                <td>{{$this_activity['this_activity_name']}}</td>
                <td>
                    {{$this_activity['activity_name']}}
                    @isset($this_activity['results_object_name'])
                        <br>{!!$this_activity['results_object_name']!!}
                    @endisset
                </td>
                <td>{{$this_activity['result_value']}}</td>
            </tr>
        @endforeach
    </table>
    <br>
@endforeach

@include('footer') 
