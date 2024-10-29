@include('header')

<table>
@foreach($all_events as $this_event)
    <tr>
        <td>{!!get_href_by_type_and_id('location',$this_event->location_id);!!}</td>
        <td>{!!$this_event->get_href();!!}</td>
        <td>{{date_display($this_event->date);}}</td>
    </tr>
@endforeach
</table>

@foreach($blocks as $this_block)
    <hr><br>
    <table>
    @foreach($this_block as $this_element)
        <tr>
            <td>{!!$this_element->get_href();!!}</td>
        </tr>
    @endforeach
    </table>
@endforeach

@include('footer')
