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

@include('footer') 
