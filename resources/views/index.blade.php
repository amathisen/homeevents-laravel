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

<hr><br>

<table>
@foreach($all_users as $this_user)
    <tr>
        <td>{!!$this_user->get_href();!!}</td>
    </tr>
@endforeach
</table>

<hr><br />
        
<table>
@foreach($all_activity_objects as $this_activity_object)
    <tr>
        <td>{!!$this_activity_object->get_href();!!}</td>
    </tr>
@endforeach
</table>

@include('footer')
