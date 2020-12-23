# 나의 풀이
n = int(input())
count = 0


def containThree(list):
    for item in list:
        for string in item:
            for char in string:
                if(char == "3"):
                    return 1
    return 0


for i in range(n + 1):
    for j in range(60):
        for k in range(60):
            times = [str(i), str(j), str(k)]
            count += containThree(times)

print(count)

# 나동빈님 풀이
# H를 입력받기
h = int(input())

count = 0
for i in range(h + 1):
    for j in range(60):
        for k in range(60):
            # 매 시각 안에 '3'이 포함되어 있다면 카운트 증가
            if '3' in str(i) + str(j) + str(k):
                count += 1

print(count)
# 문자열에 대한 이해가 아직 부족한 것 같고, 시간을 count할때는 +1을 해줘야한다는 사실을 잊지 말 것!
