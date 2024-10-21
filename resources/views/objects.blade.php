@include('header')

<!-- Begin show object types -->
@if(isset($tables) && count($tables))
    <table class="block">
    @foreach($tables as $this_table)
        <tr>
            <td><a href = "/objects/{{$this_table}}">{{$this_table}}</td>
            <td><a href = "/objects/{{$this_table}}/new">Add New</td>
        </tr>
    @endforeach
    </table>
@endif
<!-- End show object types -->

<!-- Begin show objects -->
@if(isset($row_results) && count($row_results))
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
@endif
<!-- End show objects -->

<!-- Begin edit/create object -->
@if(isset($fields) && count($fields))
    <table>
    <form>
    @foreach($fields as $this_field)
        <tr>
            <td>{{$this_field[0]}}</td>
            <td>{!!$this_field[1]!!}</td>
        </tr>
    @endforeach
        <tr><td colspan="2"><input type="submit" value="{{$submit_text}}"></td></tr>
    </form>
    </table>
@endif
<!-- End edit/create object -->

@include('footer')
