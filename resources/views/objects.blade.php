@include('header')

@if(isset($tables) && count($tables))
<!-- Begin show object types -->
    <table class="block">
    @foreach($tables as $this_table)
        <tr>
            <td><a href = "/objects/{{$this_table}}">{{$this_table}}</td>
            <td><a href = "/objects/{{$this_table}}/new">Add New</td>
        </tr>
    @endforeach
    </table>
<!-- End show object types -->
@endif

@if(isset($row_results) && count($row_results))
<!-- Begin show objects -->
    <a href = "/objects/{{$object_type}}/new">Add New</a>
    <br>
    <br>
    <table class="block">
    @foreach($row_results as $this_row)
        <tr>
            <td><a href = "/objects/{{$object_type}}/{{$this_row[0]}}">Edit</a></td>
            @foreach($this_row[1] as $these_fields)
                <td>{{$these_fields[0]}}</td>
                <td>{!!$these_fields[1]!!}</td>
            @endforeach
        </tr>
    @endforeach
    </table>
<!-- End show objects -->
@endif

@if(isset($fields) && count($fields))
<!-- Begin edit/create object -->
    <a href = "/objects/{{$object_type}}">View All {{$object_type}}</a>
    <br>
    <br>
    <table>
    <form method="post" action="/objects/crud">
        <input type="hidden" name="object_type" value="{{$object_type}}">
        @csrf
        @foreach($fields as $this_field)
            <tr>
                <td>{{$this_field[0]}}</td>
                <td>{!!$this_field[1]!!}</td>
            </tr>
        @endforeach
            <tr><td colspan="2"><input type="submit" value="{{$submit_text}}"></td></tr>
    </form>
    </table>
    @if((int)$object_id > 0)
        <br>
        <br>
        <br>
        <form method="post" action="/objects/crud">
            @csrf
            <input type="hidden" name="object_type" value="{{$object_type}}">
            <input type="hidden" name="id" value="{{$object_id}}">
            <input type="hidden" name="delete" value="solongfarewell">
            <input type="submit" value="Delete">
        </form>
    @endif
<!-- End edit/create object -->
@endif

@include('footer')
