program arrays;
    uses sysutils;
    type
        IntArr = Array of Integer;
    var
        numbers, aboveArr, belowArr : IntArr;
        above, below : Word;
        maximum : Integer;
        average : Real;
    
        procedure getNumbers(var output : IntArr);
            var
                input : string;
                count : Word;
        begin
            count := 0;
            Write('Write number or "s" to stop: ');
            ReadLn(input);
            while (input <> 's') do
            begin
                inc(count);
                SetLength(numbers, count);
                output[count - 1] := StrToInt(input);
                Write('Write number or "s" to stop: ');
                ReadLn(input);
            end;
        end;

        function getMaxIndex(var input : IntArr) : Word;
            var
                maximum : Integer;
                i, maxIndex : Word;
        begin
            i := 0;
            maximum := input[i];
            maxIndex := 0;
            for i := 0 to Length(input) do
            begin
                if (maximum < input[i]) then
                begin
                    maxIndex := i;
                    maximum := input[i];
                end;
            end;
            getMaxIndex := maxIndex;
        end;

        function getCountOf(element : Integer; var input : IntArr) : Word;
            var
                count, i : Word;
        begin
            count := 0;
            for i := 0 to Length(input) do
            begin
                if (input[i] = element) then Inc(count);
            end;
            getCountOf := count;
        end;

        function getAverage(var input : IntArr) : Real;
            var
                sum : Integer;
                i : Word;
        begin
            sum := 0; 
            for i := 0 to Length(input)-1 do
            begin
                sum := sum + input[i];
            end;
            getAverage := (sum / Length(input));
        end;

        function getEverythingAbove(value : Real; var input, output : IntArr) : Word;
            var
                count, i : Word;
        begin
            count := 0;
            for i := 0 to (Length(input) - 1) do
            begin
                if (input[i] > value) then
                begin
                    Inc(count);
                    SetLength(output, count);
                    output[count - 1] := input[i]; 
                end;
            end;
            getEverythingAbove := count;
        end;

        function getEverythingBelow(value : Real; var input, output : IntArr) : Word;
            var
                count, i : Word;
        begin
            count := 0;
            for i := 0 to Length(input) - 1 do
            begin
                if (input[i] < value) then
                begin
                    Inc(count);
                    SetLength(output, count);
                    output[count - 1] := input[i]; 
                end; 
            end;
            getEverythingBelow := count;
        end;

        procedure writeIntArray(var input : IntArr);
            var
                i : Word;
        begin
            for i := 0 to Length(input)-2 do
            begin
                Write(input[i]);
                Write(', ');
            end;
            Write(input[Length(input)-1]);
            WriteLn('.');
        end;
begin
    getNumbers(numbers);
    maximum := getMaxIndex(numbers);

    Write('Highest given number is ');
    Write(numbers[maximum]);
    Write(', in the set its on ');
    Write(maximum);
    Write('. position (counting from zero), it is ');
    Write(getCountOf(numbers[maximum], numbers));
    WriteLn(' times in the set.');

    average := getAverage(numbers);

    Write('Average of this set is: ');
    WriteLn(average:5:3);

    above := getEverythingAbove(average, numbers, aboveArr);

    Write('There are ');
    Write(above);
    Write(' above its average in this set: ');
    writeIntArray(aboveArr);

    below := getEverythingBelow(average, numbers, belowArr);

    Write('There are ');
    Write(below);
    Write(' below its average in this set: ');
    writeIntArray(belowArr);
end.