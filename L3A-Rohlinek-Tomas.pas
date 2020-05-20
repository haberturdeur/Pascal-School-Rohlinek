program arrays;
    uses sysutils;
    type
        IntArr = Array of Integer;
        RealArr = Array of Real;

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
            SetLength(output, count);
            output[count - 1] := StrToInt(input);
            Write('Write number or "s" to stop: ');
            ReadLn(input);
        end;
    end;

    function indexOfHighestValue(const input : IntArr) : Word;
        var
            maximum : Integer;
            i, maxIndex : Word;
    begin
        i := 0;
        maximum := input[i];
        maxIndex := 0;
        for i := 0 to Length(input) - 1 do
        begin
            if (maximum < input[i]) then
            begin
                maxIndex := i;
                maximum := input[i];
            end;
        end;
        indexOfHighestValue := maxIndex;
    end;

    function indexOfHighestValue(const input : RealArr) : Word;
        var
            maximum : Real;
            i, maxIndex : Word;
    begin
        i := 0;
        maximum := input[i];
        maxIndex := 0;
        for i := 0 to Length(input) - 1 do
        begin
            if (maximum < input[i]) then
            begin
                maxIndex := i;
                maximum := input[i];
            end;
        end;
        indexOfHighestValue := maxIndex;
    end;

    function indexOfLowestValue(const input : IntArr) : Word;
        var
            minimum : Integer;
            i, minIndex : Word;
    begin
        i := 0;
        minimum := input[i];
        minIndex := 0;
        for i := 0 to Length(input) - 1 do
        begin
            if (minimum > input[i]) then
            begin
                minIndex := i;
                minimum := input[i];
            end;
        end;
        indexOfLowestValue := minIndex;
    end;

    function indexOfLowestValue(const input : RealArr) : Word;
        var
            minimum : Real;
            i, minIndex : Word;
    begin
        i := 0;
        minimum := input[i];
        minIndex := 0;
        for i := 0 to Length(input) - 1 do
        begin
            if (minimum > input[i]) then
            begin
                minIndex := i;
                minimum := input[i];
            end;
        end;
        indexOfLowestValue := minIndex;
    end;

    function getCountOf(element : Integer; var input : IntArr) : Word;
        var
            count, i : Word;
    begin
        count := 0;
        for i := 0 to Length(input) - 1 do
        begin
            if (input[i] = element) then Inc(count);
        end;
        getCountOf := count;
    end;

    function getCountOf(element : Real; var input : RealArr) : Word;
        var
            count, i : Word;
    begin
        count := 0;
        for i := 0 to Length(input) - 1 do
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
        for i := 0 to Length(input) - 1 do
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
            if (input[i] >= value) then
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
            if (input[i] <= value) then
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
        if Length(input) > 2 then
        begin
            for i := 0 to (Length(input) - 2) do
            begin
                Write(input[i]);
                Write(', ');
            end;
            Write(input[Length(input) - 1]);
            WriteLn('.');
        end
        else if Length(input) = 1 then
        begin
            Write(input[0]);
            WriteLn('.');
        end
        else
            WriteLn('.');
    end;

    procedure writeRealArray(var input : RealArr);
        var
            i : Word;
    begin
        if Length(input) > 2 then
        begin
            for i := 0 to (Length(input) - 2) do
            begin
                Write(input[i]:5:3);
                Write(', ');
            end;
            Write(input[Length(input) - 1]:5:3);
            WriteLn('.');
        end
        else if Length(input) = 1 then
        begin
            Write(input[0]:5:3);
            WriteLn('.');
        end
        else
            WriteLn('.');
    end;

    procedure getDeviationsFromAverage(var input : IntArr; output : RealArr);
        var
            average : Real;
            i : Word;
    begin
        average := getAverage(input);
        for i:= 0 to Length(input) - 1 do
        begin
            output[i] := abs(average - input[i]);
        end;
    end;

    function getIndexesOfValue(const value : Integer; input: IntArr; var output : IntArr) : Word;
        var
            count, i : Word;
    begin
        count := 0;
        for i := 0 to Length(input) - 1 do
        begin
            if input[i] = value then
            begin
                Inc(count);
                SetLength(output, count);
                output[count - 1] := i;
            end;
        end;
        getIndexesOfValue := count; 
    end;

    function getIndexesOfValue(const value : Real; input: RealArr; var output : IntArr) : Word;
        var
            count, i : Word;
    begin
        count := 0;
        for i := 0 to Length(input) - 1 do
        begin
            if input[i] = value then
            begin
                Inc(count);
                SetLength(output, count);
                output[count - 1] := i;
            end;
        end;
        getIndexesOfValue := count; 
    end;

    function removeRedundant(var input : IntArr) : Word;
        var
            outputtedIndexes, output : IntArr;
            i, j, count, check : Word;
    begin
        count := 0;
        for i := 0 to Length(input) - 1 do
        begin
            SetLength(outputtedIndexes, count + 1);
            check := 1;
            for j := 0 to Length(outputtedIndexes) - 1 do
            begin
                if input[i] = input[outputtedIndexes[j]] then
                begin
                    check := 0;
                end;
            end;
            if check = 1 then
            begin
                outputtedIndexes[count] := i;
                SetLength(output, count + 1);
                output[count] := input[i]; 
                Inc(count);
            end;
        end;
        SetLength(input, count);
        for i := 0 to count - 1 do
            input[i] := output[i];
        removeRedundant := count;
    end;

    function removeRedundant(const input : IntArr; var output : IntArr) : Word;
        var
            outputtedIndexes : IntArr;
            i, j, count, check : Word;
    begin
        count := 0;
        WriteLn(Length(input));
        for i := 0 to Length(input) - 1 do
        begin
            SetLength(outputtedIndexes, count + 1);
            outputtedIndexes[0] := 0;
            check := 1;

            for j := 0 to Length(outputtedIndexes) - 1 do
            begin
                if input[i] <> input[outputtedIndexes[j]] then
                begin
                    check := 0;
                end;
            end;

            if check = 1 then
            begin
                outputtedIndexes[count] := i;
                SetLength(output, count + 1);
                output[count] := input[i];
                Inc(count);
            end;
        end;
        WriteLn(Length(output));
        removeRedundant := count + 1;
    end;

    var
        numbers, aboveArr, belowArr, closestIndexes, closestValues, NewClosestValues : IntArr;
        deviations : RealArr;
        above, below, closest, countOfClosest, i : Word;
        maximum : Integer;
        average : Real;

begin
    SetLength(numbers, 1);
    getNumbers(numbers);
    maximum := indexOfHighestValue(numbers);
    SetLength(deviations, Length(numbers));

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

    getDeviationsFromAverage(numbers, deviations);

    Write('Deviations are: ');
    writeRealArray(deviations);

    closest := indexOfLowestValue(deviations);
    countOfClosest := getIndexesOfValue(deviations[closest], deviations, closestIndexes);

    if countOfClosest = 1 then
    begin
        Write('Index of element closest to the average is: ');
        Write(closest);
        Write(' which has value: ');
        Write(numbers[closest]);
        Write('. Its deviation from average is: ');
        WriteLn(deviations[closest]:5:3);
    end
    else
    begin
        SetLength(closestValues, countOfClosest);
        SetLength(NewClosestValues, countOfClosest);
        for i := 0 to countOfClosest - 1 do
            closestValues[i] := numbers[closestIndexes[i]];
        countOfClosest := removeRedundant(closestValues, NewClosestValues);

        if countOfClosest = 1 then
        begin
            Write('There are multiple elemets with same value which are closest to the average, first index containing this element is: ');
            Write(closest);
            Write(' which has value: ');
            Write(numbers[closest]);
            Write('. Its deviation from average is: ');
            WriteLn(deviations[closest]:5:3);
        end
        else
        begin
            Write('There are multiple elemets closest to the average, their indexes are: ');
            writeIntArray(closestIndexes);
            Write(' which contain values: ');
            writeIntArray(NewClosestValues);
            Write('Their deviation from average is: ');
            WriteLn(deviations[closest]:5:3);
        end;

        // Write('There are ');
        // Write(countOfClosest);
        // Write('');
    end;

    
end.