<div>
<b>{{$leaderboard['name']}}</b>
<br>
{{$leaderboard['description']}}
<br>
<table class="block">
    <tr>
        <td class="title">User</td>
        <td class="title">Score</td>
    </tr>
@foreach($leaderboard['results'] as $this_result)
    <tr>
        <td>{!!get_href_by_type_and_id('users',$this_result['users_id']);!!}</td>
        <td>{{$this_result['score']}}</td>
    </tr>
@endforeach
</table>
</div>
