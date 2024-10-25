@include('header')

<center>
    <h1>{{$location->name}}</h1>
    <h2>{{$location->address}}</h2>
</center>
<br>
<b>Events Held:</b> {{count($events)}}<br>
<br>

<br><hr><br>

<table>
@foreach($events as $this_event)
    <tr>
        <td>{{date_display($this_event->date);}}</td>
        <td>{!!$this_event->get_href();!!}</td>
    </tr>
@endforeach
</table>

@include('footer')
