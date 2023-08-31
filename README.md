# SpringBoot
TeamProject

origin 로컬에서 깃허브 원격 저장소로 보내는 깃 명령어 

1.git init 

2.git clone https://github.com/kims26/SpringBoot.git(깃 허브 내 레포 )

3.git add .(내가 작업한 코드 저장 )

4.git commit -m "작업 내용(커밋 메시지)" 

5.git push origin master (내 로컬저장소에서 깃허브 저장소 로 보낸다 master branch 로)


팀 프로젝트 깃허브 사용

레포지토리 운영 

    1. 공용 레포지토리를 Fork(깃 관리자가 만들어 놓은 레포지토리를 포크 )
    
    2. 개인 레포지토리를 로컬 환경으로 clone  (git clone https://github.com/kims26/SpringBoot.git(깃관리자 레포지토리  )
    
    3. 공용 레포지토리의 URL을 복사하고, 로컬 터미널에서 리모트를 등록합니다
    
    - `git remote add team (URL)` 로 등록한 뒤 `git remote -v`를 입력
    
    4. 작업한 코드 업로드는 `git push origin (branch)` 를 이용하고, 개인 레포지토리에서 pull request를 이용하여 코드를 제출
    
    5. 팀 멤버들과 함께 코드 리뷰를 하며 공용 레포지토리에 코드를 merge
    
    6. 로컬 환경의 코드를 최신화하기 위해 merge 이후에는 반드시 `git pull team (branch)`를 입력
    
  브랜치 운영 팁
  
    완성되지 않은 코드는 master나 main에 병합하지 않도록 유의하여야 하고, 처음부터 dev 브랜치를 생성하여 개발 코드를 관리
    
    추가적으로, 기능 단위로 브랜치를 생성하고, 기능 개발이 완료되면 dev 브랜치로 병합하게 되면 코드 관리가 한결 수월
    


