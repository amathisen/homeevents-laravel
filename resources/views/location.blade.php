@include('header')

<center>
    <h1>{{$location->name}}</h1>
    <h2>{{$location->address}}</h2>
</center>
<br>
<b>Events Held:</b> {{count($location->get_ref_values('event'))}}<br>
<br>

<br><hr><br>

<table>
@foreach($location->get_ref_values('event') as $this_event)
    <tr>
        <td>{{date_display($this_event['date']);}}</td>
        <td>{!!get_href_by_type_and_id('event',$this_event['id']);!!}</td>
    </tr>
@endforeach
</table>

@include('footer')
