# 나의 풀이
count = 0
data = input()

row = data[0]
col = int(data[1])

operation = [[2, -1], [2, 1], [1, 2], [1, -2]]
row_data = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
rowIndex = 0
for item in row_data:
    if(row == item):
        break
    rowIndex += 1

for i in range(8):
    tempRowIndex = rowIndex
    tempColIndex = col

    if(i < 4):
        tempRowIndex += operation[i][0]
        tempColIndex += operation[i][1]
    else:
        tempRowIndex += operation[i % 4][0] * -1
        tempColIndex += operation[i % 4][1] * -1
    if(tempRowIndex < 0 or tempRowIndex > 8 or tempColIndex < 1 or tempColIndex > 8):
        continue
    count += 1
print(count)

# 나동빈님 풀이
# 현재 나이트의 위치 입력받기
input_data = input()
row = int(input_data[1])
column = int(ord(input_data[0])) - int(ord('a')) + 1

# 나이트가 이동할 수 있는 8가지 방향 정의
steps = [(-2, -1), (-1, -2), (1, -2), (2, -1),
         (2, 1), (1, 2), (-1, 2), (-2, 1)]

# 8가지 방향에 대하여 각 위치로 이동이 가능한지 확인
result = 0
for step in steps:
    # 이동하고자 하는 위치 확인
    next_row = row + step[0]
    next_column = column + step[1]
    # 해당 위치로 이동이 가능하다면 카운트 증가
    if next_row >= 1 and next_row <= 8 and next_column >= 1 and next_column <= 8:
        result += 1

print(result)
# 알파벳을 입력받는 경우 ord함수를 이용해 반환되는 ascii값 이용하기
# 방향연산을 하는 경우 좌표 값 한번에 더하기 ex(2, -1)
