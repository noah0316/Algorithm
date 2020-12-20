# 나의 풀이
n, m = map(int, input().split())
data = []
for i in range(0, n):
    data.insert(i, sorted(map(int, input().split())))

max = data[0][0]
for i in range(0, n):
    if(data[i][0] > max):
        max = data[i][0]
print(max)

# 나동빈님 풀이
# N, M을 공백을 기준으로 구분하여 입력 받기
n, m = map(int, input().split())

result = 0
# 한 줄씩 입력 받아 확인하기
for i in range(n):
    data = list(map(int, input().split()))
    # 현재 줄에서 '가장 작은 수' 찾기
    min_value = min(data)
    # '가장 작은 수'들 중에서 가장 큰 수 찾기
    result = max(result, min_value)

print(result)  # 최종 답안 출력

# Python Built-in Function을 많이 알아 볼 것!!
