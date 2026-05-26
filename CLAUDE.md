# 동아대학교 교원관리 대시보드 프로젝트 지침

==============================
## 저장소 및 배포
==============================

- GitHub: github.com/intro0509/Dashbaord-Test
- 배포 URL: https://intro0509.github.io/Dashbaord-Test/dashboard.html
- 회사 경로: C:\Users\WIN\Dashbaord-Test\
- 집 경로: C:\Users\탁규만\Dashbaord-Test\
- 배치파일: upload_dashboard.bat (git fetch → reset --hard origin/main → add → commit → push)


==============================
## 기본 정보
==============================

- 회사 모니터: 1920x1080 (기준 해상도)
- 집 모니터: 3840x2160 (200% 배율 → 브라우저 인식 1920px)
- 메인 색상: (추후 작성)
- 서브 색상: (추후 작성)


==============================
## 수정 작업 루틴
==============================

기본 루틴: 수정 요청 → 누적 → 수정 파일 생성(★ Dashboard) → 배포 → 직전 배포 파일 업로드 → 추가 수정 요청 (반복)

* 추가 수정 요청 시 직전 배포 파일을 업로드하지 않은 경우, 업로드를 먼저 요청할 것

파일 생성 기준:
- 간단한 수정(문구, 색상 등): 5개 누적 후 생성 (사용자가 즉시 요청 시 즉시 생성)
- 레이아웃 변경, 중대한 오류 복구: 즉시 생성 (누적 수정사항 함께 반영)

수정 카운트 관리:
- 수정 요청을 받을 때마다 내용을 요약하여 누적 리스트업하고 파일 생성 후 카운트 및 리스트 리셋
- 파일 생성 시 수정한 내용 요약 노티


==============================
## 파일명 규칙
==============================

- 대시보드: ★ Dashboard
- 배치파일: ★ Dashboard Uploader
- Raw데이터 생성기: ★ Upload File Generator


==============================
## 검증 규칙 - 절대 생략 불가
==============================

수정 완료 후 파일 제공 전 반드시 검증 스크립트 실행.
결과가 모두 ✓일 때만 파일 제공.
하나라도 ✗가 나오면 재수정 후 재검증.


==============================
## 주의사항
==============================

1. 수정 시작 전 수정완료항목 충돌 여부 반드시 확인.
   충돌 없으면 바로 수정, 충돌 있으면 내용과 선택지 제시 후 승인받고 진행.
2. 수정이 다른 영역에 미치는 영향 면밀히 검토 후 필요 시 노티.
3. 동일한 수정 요청이 반복될 때는 지엽적 수정이 아닌 근본 원인 분석 후 해결. (HTML, CSS, JS 모두 분석, 필요 시 Chart.js도 분석)
4. 수정 요청을 지엽적으로만 판단하지 말고 전체적인 영향도 검토.


==============================
## 개발모드 기능 - 완성 후 삭제 예정
==============================

- 활성화 방법: 소스에서 DEV_ENABLED = false → true 변경
- 삭제 방법: "개발모드 기능 삭제해줘" 요청
- 포함 기능:
  1. 뷰포트 크기 + scrollLeft 값 실시간 표시
  2. 각 카드 경계선 (빨간 점선)
  3. main-grid 열/행 구분선 (파란 실선)
  4. 각 카드 offsetHeight 값
- CSS 위치: 첫번째 </style> 직전 "개발모드 CSS" 블록
- JS 위치: 마지막 </script> 직전 "개발모드 JS" 블록


==============================
## 수정완료항목 (고정항목 - 충돌 시 반드시 노티)
==============================

### 기본 규칙 4가지
1. .page.active → justify-content:flex-start (center 금지)
2. .page.active → overflow:visible (hidden 금지)
3. topnav CSS → width:1920px (고정)
4. appWrapper inline style에 overflow-x 없어야 함


### 레이아웃
- main-grid: 3열 minmax(0,1fr), gap:14px
- card-college: grid-row:span 3 + display:flex + padding:0
- card-college card-hd: padding:18px 18px 0
- college-scroll: flex:1 + min-height:0 + overflow-y:auto + padding:12px 18px 18px
- card-heatmap: grid-row:span 2 + overflow-y:auto + overflow-x:auto
- card-retire: Row4 Col3 (연령별과 같은 행)
- 히트맵 셀: 38x38px
- 히트맵 가로 레이블: width:45px + height:38px
- 히트맵 세로 레이블: width:38px + height:38px


### 고정 레이아웃 (1920px 기준)
- scaleRoot: width:1888px 고정, transform 없음
- topnav: width:1888px 고정, transform 없음
- appWrapper: overflow-x:scroll + 스크롤바 숨김 (scrollProxy가 가로 스크롤 담당), margin:0 (body padding:16px이 여백 담당)
- body: padding:16px, box-sizing:border-box
- scrollProxy: 뷰포트 1920px 미만일 때 가로 스크롤바 표시 (window.innerWidth < 1920)
- 화면이 넓어지면 좌우 여백만 생김, 화면이 좁아지면 스크롤바만 생김
- 확대/축소(scale) 없음
- adjust 실행 순서: adjustHeatmapHeight → adjustRetireHeight → adjustCollegeHeight


### UI 세부
- top-header: minmax(0,1fr)x2 / rate-card: min-width:0 + overflow:hidden
- 스파크라인: flex:1 + min-width:60px + margin-left:6px + tension:0 (직선)
- kpi-delta-sm: background:#e5e7eb + border-radius:6px + flex-shrink:0 (margin-top 없음)
- kpi-num-sm: font-size:18px
- kpi-row: min-width:0
- kpi-card-sm: gap:8px + min-width:0
- kpi-info: flex:1 + min-width:0
- fchip / filter-label / filter-reset-btn: font-size:13px + padding:6px 14px
- nav-group: flex:0 0 auto (Recruitment까지만 표시)
- Radial 범례: ▽
- 의학계열 포함 범례: dashed #d1d5db
- 출처 문구: font-size:13px


### 주요 카드 id
- card-track: 트랙별 현황
- card-nt: 비정년트랙별 현황
- card-rank: 직급별 현황
- card-gender: 성별 현황
- card-heatmap: 연령x재직기간 분포
- card-tenure: 재직기간별 분포
- card-age: 연령별 분포
- card-college: 단과대학별 현황
- card-retire: 정년퇴직 예정자 현황
