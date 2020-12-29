# 나의 풀이
n, m = map(int, input().split())
a, b, d = map(int, input().split())


def turnLeft(d):
    if d == 0:
        d = 3
    else:
        d -= 1
    return d


def turnBack(d):
    if d == 3 or d == 2:
        d -= 2
    else:
        d += 2
    return d


# 북 동 남 서
dx = [0, 1, 0, -1]
dy = [-1, 0, 1, 0]
map_data = []
visited = []
turn_time = 0

# 입력
for i in range(n):
    data = list(map(int, input().split()))
    map_data.append(data)

visited.append([b, a])
while(True):
    ta, tb = a, b
    td = d
    isVisit = False
    # 왼쪽부터 탐색
    td = turnLeft(td)

    if(map_data[tb + dy[td]][ta + dx[td]] == 0):
        # 방문기록 확인
        for i in visited:
            if(i[0] == ta + dx[td] and i[1] == tb + dy[td]):
                isVisit = True
                break

        d = turnLeft(d)

        if(isVisit == False):
            a += dx[d]
            b += dy[d]
            turn_time = 0
            visited.append([a, b])

    else:
        # 바다인 경우
        # 3번 과정
        if(turn_time == 4):
            td = turnBack(d)
            if(map_data[b + dy[td]][a + dx[td]] == 0):
                td = turnBack(d)
                a += dx[td]
                b += dy[td]
            else:
                break
            turn_time = 0
        d = turnLeft(d)
        turn_time += 1
    if(isVisit == True):
        turn_time += 1

print(len(visited))

# 나동빈님 풀이
# N, M을 공백을 기준으로 구분하여 입력받기
n, m = map(int, input().split())

# 방문한 위치를 저장하기 위한 맵을 생성하여 0으로 초기화
d = [[0] * m for _ in range(n)]
# 현재 캐릭터의 X 좌표, Y 좌표, 방향을 입력받기
x, y, direction = map(int, input().split())
d[x][y] = 1  # 현재 좌표 방문 처리

# 전체 맵 정보를 입력받기
array = []
for i in range(n):
    array.append(list(map(int, input().split())))

# 북, 동, 남, 서 방향 정의
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]

# 왼쪽으로 회전


def turn_left():
    global direction
    direction -= 1
    if direction == -1:
        direction = 3


# 시뮬레이션 시작
count = 1
turn_time = 0
while True:
    # 왼쪽으로 회전
    turn_left()
    nx = x + dx[direction]
    ny = y + dy[direction]
    # 회전한 이후 정면에 가보지 않은 칸이 존재하는 경우 이동
    if d[nx][ny] == 0 and array[nx][ny] == 0:
        d[nx][ny] = 1
        x = nx
        y = ny
        count += 1
        turn_time = 0
        continue
    # 회전한 이후 정면에 가보지 않은 칸이 없거나 바다인 경우
    else:
        turn_time += 1
    # 네 방향 모두 갈 수 없는 경우
    if turn_time == 4:
        nx = x - dx[direction]
        ny = y - dy[direction]
        # 뒤로 갈 수 있다면 이동하기
        if array[nx][ny] == 0:
            x = nx
            y = ny
        # 뒤가 바다로 막혀있는 경우
        else:
            break
        turn_time = 0

# 정답 출력
print(count)
# 별도의 알고리즘이 필요하기 보다 문제에서 요구하는 내용을 오류없이 구현하면 되는 문제.
# 한번 논리가 꼬이기 시작하면 끝도없이 꼬여서 힘이 들었다.
# 반복적인 숙달이 필요한 문제.
