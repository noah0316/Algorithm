# 나의 풀이
n, k = map(int, input().split())
cnt = 0

while True:
    if n % k == 0:
        n /= k
    else:
        n -= 1
    cnt += 1
    if n == 1:
        break
print(cnt)

# 나동빈님 풀이
# N, K공백을 기준으로 구분하여 입력 받기
n, k = map(int, input().split())
result = 0

while True:
    # N이 K로 나누어 떨어지는 수가 될 때까지만 1씩 빼기
    target = (n // k) * k
    result += (n - target)
    n = target
    # N이 K보다 작을 때 (더 이상 나눌 수 없을 때) 반복문 탈출
    if n < k:
        break
    # K로 나누기
    result += 1
    n //= k

# 마지막으로 남은 수에 대하여 1씩 빼기
result += (n - 1)
print(result)
