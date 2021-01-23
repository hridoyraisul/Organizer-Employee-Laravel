<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">


    <title>Raisul Islam's Assignment</title>
</head>
<body>
<div class="container">
    <div class="container-header">
        <div class="row">
            <div class="col-md-6">
                <h2 style="color: #a0aec0">Hello, <strong>{{$employeeInfo->name}}</strong></h2> <h1 style="color: #a0aec0">Welcome to {{$deptInfo->name}}</h1>
            </div>
            <div class="col-md-5"></div>
            <div class="col-md-1"><br><a href="{{url('/logout')}}" class="btn btn-outline-warning">Logout</a></div>
        </div>
    </div>
    <div class="container-body">
        <br><hr>
        <h3 style="color: #a0aec0" align="center">Department's Overview:</h3>
        <hr>
    </div>
</div>

{{--Organogram of dept--}}
<div id="wrapper">
    <div id="container">
        <ol class="organizational-chart">
                @if($deptRole == 'CEO')
                    <li>
                        <div class="col-md-4">
                            <h1>CEO: {{$employeeInfo->name}} (You)</h1>
                        </div>
                        <ol>
                            <li>
                            @foreach($deptInfo->coo as $coo)
                                        <div>
                                            <h2>COO: {{\App\Models\Employee::where('email',$coo)->first()->name}}</h2>
                                        </div>
                            @endforeach
                            <ol>
                                @foreach($deptInfo->general_manager as $gm)
                            <li>
                <div>
                    <h3>GM: {{\App\Models\Employee::where('email',$gm)->first()->name}}</h3>
                </div>
                <ol>
                    @foreach($deptInfo->manager as $m)
                        <li>
                            <div>
                                <h3>Manager: {{\App\Models\Employee::where('email',$m)->first()->name}}</h3>
                            </div>
                            <ol>
                                @foreach($deptInfo->supervisor as $sup)
                                    <li>
                                        <div>
                                            <h3>Supervisor: {{\App\Models\Employee::where('email',$sup)->first()->name}}</h3>
                                        </div>
                                    </li>
                                @endforeach
                                <ol>
                                    @foreach($deptInfo->staff as $st)
                                        <li>
                                            <div>
                                                <h3>Staff: {{\App\Models\Employee::where('email',$st)->first()->name}}</h3>
                                            </div>

                                        </li>
                                    @endforeach
                                </ol>
                            </ol>
                        </li>
                    @endforeach
                </ol>
            </li>
                                @endforeach
                            </ol>
                            </li>
                        </ol>
                    </li>
                @endif
                @if($deptRole == 'COO')
                    <li>
                        <div>
                            <h2>COO: {{$employeeInfo->name}} (You)</h2>
                        </div>
                        <ol>
                            @foreach($deptInfo->general_manager as $gm)
                                <li>
                                    <div>
                                        <h3>GM: {{\App\Models\Employee::where('email',$gm)->first()->name}}</h3>
                                    </div>
                                    <ol>
                                        @foreach($deptInfo->manager as $m)
                                            <li>
                                                <div>
                                                    <h3>Manager: {{\App\Models\Employee::where('email',$m)->first()->name}}</h3>
                                                </div>
                                                <ol>
                                                    @foreach($deptInfo->supervisor as $sup)
                                                        <li>
                                                            <div>
                                                                <h3>Supervisor: {{\App\Models\Employee::where('email',$sup)->first()->name}}</h3>
                                                            </div>
                                                            <ol>
                                                                @foreach($deptInfo->staff as $st)
                                                                    <li>
                                                                        <div>
                                                                            <h3>Staff: {{\App\Models\Employee::where('email',$st)->first()->name}}</h3>
                                                                        </div>

                                                                    </li>
                                                                @endforeach
                                                            </ol>
                                                        </li>
                                                    @endforeach
                                                </ol>
                                            </li>
                                        @endforeach
                                    </ol>
                                </li>
                            @endforeach
                        </ol>
                    </li>
                @endif
                @if($deptRole == 'General Manager')
                    <li>
                        <div>
                            <h3>GM: {{$employeeInfo->name}} (You)</h3>
                        </div>
                        <ol>
                            @foreach($deptInfo->manager as $m)
                                <li>
                                    <div>
                                        <h3>Manager: {{\App\Models\Employee::where('email',$m)->first()->name}}</h3>
                                    </div>
                                    <ol>
                                        @foreach($deptInfo->supervisor as $sup)
                                            <li>
                                                <div>
                                                    <h3>Supervisor: {{\App\Models\Employee::where('email',$sup)->first()->name}}</h3>
                                                </div>
                                                <ol>
                                                    @foreach($deptInfo->staff as $st)
                                                        <li>
                                                            <div>
                                                                <h3>Staff: {{\App\Models\Employee::where('email',$st)->first()->name}}</h3>
                                                            </div>

                                                        </li>
                                                    @endforeach
                                                </ol>
                                            </li>
                                        @endforeach
                                    </ol>
                                </li>
                            @endforeach
                        </ol>
                    </li>
                @endif
                @if($deptRole == 'Manager')
                    <li>
                        <div>
                            <h3>Manager: {{$employeeInfo->name}} (You)</h3>
                        </div>
                        <ol>
                            @foreach($deptInfo->supervisor as $sup)
                                <li>
                                    <div>
                                        <h3>Supervisor: {{\App\Models\Employee::where('email',$sup)->first()->name}}</h3>
                                    </div>
                                    <ol>
{{--                                        staff er loop--}}
                                    </ol>
                                </li>
                            @endforeach
                                @foreach($deptInfo->staff as $st)
                                    <li>
                                        <div>
                                            <h3>Staff: {{\App\Models\Employee::where('email',$st)->first()->name}}</h3>
                                        </div>

                                    </li>
                                @endforeach
                        </ol>
                    </li>
                @endif
                @if($deptRole == 'Supervisor')
                    <li>
                        <div>
                            <h3>Supervisor: {{$employeeInfo->name}} (You)</h3>
                        </div>
                        <ol>
                            @foreach($deptInfo->staff as $st)
                                <li>
                                    <div>
                                        <h3>Staff: {{\App\Models\Employee::where('email',$st)->first()->name}}</h3>
                                    </div>

                                </li>
                            @endforeach

                        </ol>
                    </li>
                @endif
                @if($deptRole == 'Staff')
                    @foreach($deptInfo->staff as $st)
                        <li>
                            <div>
                                <h3>Staff: {{\App\Models\Employee::where('email',$st)->first()->name}}</h3>
                            </div>
                        </li>@endforeach
                @endif
        </ol>
    </div>
</div>
<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<!-- Option 2: jQuery, Popper.js, and Bootstrap JS
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
-->
</body>
</html>
