function [totalValue, rowIndex] = processMatrix(matrixData)
    [numRows, numCols] = size(matrixData);
    minDimension = min(numRows, numCols);
    zeroMatrix = zeros(numRows, numCols);
    tempMatrix = zeros(numRows, numCols);
    rowVector = zeros(numRows, 1);
    colVector = zeros(1, numCols);
    adjustedMatrix = zeros(numRows, numCols);

    parfor i = 1:numRows
        rowMin = min(matrixData(i, :));
        adjustedMatrix(i, :) = matrixData(i, :) - rowMin;
    end

    for i = 1:numRows
        for j = 1:numCols
            if adjustedMatrix(i, j) == 0 && (sum(zeroMatrix(i, :)) == 0) && (sum(zeroMatrix(:, j)) == 0)
                zeroMatrix(i, j) = 1;
            end
        end
    end

    stateVector = zeros(1, 5);
    stateVector(1) = 1;

    while stateVector(5) == 0
        if stateVector(1) == 1
            parfor j = 1:numCols
                colSum = sum(zeroMatrix(:, j));
                if colSum > 0
                    colVector(j) = 1;
                end
            end
            if sum(colVector) == minDimension
                stateVector = zeros(1, 5);
                stateVector(5) = 1;
            else
                stateVector = zeros(1, 5);
                stateVector(2) = 1;
            end
        end

        if stateVector(2) == 1
            combinedMatrix = adjustedMatrix + ones(numRows, 1) * colVector + rowVector * ones(1, numCols);
            [zeroRows, zeroCols] = find(combinedMatrix == 0);

            for j = 1:length(zeroRows)
                currentRow = zeroRows(j);
                currentCol = zeroCols(j);
                tempMatrix(currentRow, currentCol) = 1;

                if sum(zeroMatrix(currentRow, :)) == 0
                    stateVector = zeros(1, 5);
                    stateVector(3) = 1;
                    break;
                else
                    rowVector(currentRow) = 1;
                    assignedCol = find(zeroMatrix(currentRow, :) == 1);
                    colVector(assignedCol) = 0;
                end
            end

            if stateVector(3) == 0
                rowInf = rowVector * ones(1, numCols) * inf;
                rowInf(find(isnan(rowInf) == 1)) = 0;
                colInf = ones(numRows, 1) * colVector * inf;
                colInf(find(isnan(colInf) == 1)) = 0;
                combinedMatrix = adjustedMatrix + rowInf + colInf;
                minValue = min(min(combinedMatrix));
                [minRow, minCol] = find(combinedMatrix == minValue);
                minRow = minRow(1);
                minCol = minCol(1);
                stateVector = zeros(1, 5);
                stateVector(4) = 1;
            end
        end

        if stateVector(3) == 1
            isTrue = true;
            coordArray = [currentRow, currentCol];

            while isTrue
                assignedRow = find(zeroMatrix(:, currentCol) == 1);
                zeroMatrix(currentRow, currentCol) = 1;

                if isempty(assignedRow)
                    isTrue = false;
                else
                    newRow = assignedRow(1);
                    coordPair = [newRow, currentCol];
                    coordArray = [coordArray; coordPair];
                    zeroMatrix(newRow, currentCol) = 0;
                    currentRow = newRow;
                    currentCol = find(tempMatrix(currentRow, :) == 1);
                    currentCol = currentCol(1);
                    coordPair = [currentRow, currentCol];
                    coordArray = [coordArray; coordPair];
                end
            end

            tempMatrix = zeros(numRows, numCols);
            rowVector = zeros(numRows, 1);
            colVector = zeros(1, numCols);
            stateVector = zeros(1, 5);
            stateVector(1) = 1;
        end

        if stateVector(4) == 1
            adjustedMatrix = adjustedMatrix + rowVector * ones(1, numCols) * minValue;
            colDifference = ones(1, numCols) - colVector;
            adjustedMatrix = adjustedMatrix - ones(numRows, 1) * colDifference * minValue;
            stateVector = zeros(1, 5);
            stateVector(2) = 1;
        end
    end

    finalMatrix = zeroMatrix;
    totalValue = 0;
    [rowIndex, colIndex] = find(zeroMatrix == 1);

    for j = 1:length(rowIndex)
        totalValue = totalValue + matrixData(rowIndex(j), colIndex(j));
    end
end
