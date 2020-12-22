# 나의 풀이
n = int(input())
cmd = input().split()

x, y = 1, 1

for i in cmd:
    tempX, tempY = x, y
    if i == 'L':
        tempY -= 1
    elif i == 'R':
        tempY += 1
    elif i == 'U':
        tempX -= 1
    elif i == 'D':
        tempX += 1
    if(tempX < 1 or tempY < 1 or tempX > n or tempY > n):
        continue
    x, y = tempX, tempY
print(x, y)

# 나동빈님 풀이
# N 입력받기
n = int(input())
x, y = 1, 1
plans = input().split()

# L, R, U, D에 따른 이동 방향
dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]
move_types = ['L', 'R', 'U', 'D']

# 이동 계획을 하나씩 확인
for plan in plans:
    # 이동 후 좌표 구하기
    for i in range(len(move_types)):
        if plan == move_types[i]:
            nx = x + dx[i]
            ny = y + dy[i]
    # 공간을 벗어나는 경우 무시
    if nx < 1 or ny < 1 or nx > n or ny > n:
        continue
    # 이동 수행
    x, y = nx, ny

print(x, y)
