# 포트폴리오 웹사이트

Jekyll을 사용하여 구축된 개인 포트폴리오 웹사이트입니다.

## ✨ 주요 기능

*   **인터랙티브 UI**: 채팅 형식의 UI를 통해 포트폴리오 정보를 동적으로 보여줍니다.
*   **PDF 모드**: 전체 포트폴리오를 PDF 형식으로 보거나 인쇄할 수 있는 기능을 제공합니다.
*   **기술 스택 시각화**: Chart.js를 활용하여 보유 기술 스택을 도넛 차트로 시각화하여 보여줍니다.
*   **프로젝트 갤러리**: 프로젝트 섹션에서는 이미지 갤러리를 통해 프로젝트 결과물을 확인할 수 있습니다.
*   **자격증 확인**: 자격증 항목 클릭 시, PDF 뷰어를 통해 자격증을 직접 확인할 수 있습니다.

## 🛠️ 기술 스택

*   **프레임워크**: Jekyll
*   **언어**: HTML, SCSS, JavaScript
*   **라이브러리**: Chart.js

## 🚀 로컬에서 실행하기

1.  **Ruby 및 Jekyll 설치**: 시스템에 Ruby와 Jekyll이 설치되어 있어야 합니다.
2.  **의존성 설치**:
    ```bash
    bundle install
    ```
3.  **로컬 서버 실행**:
    ```bash
    bundle exec jekyll serve
    ```
4.  브라우저에서 `http://localhost:4000`으로 접속하여 확인합니다.

---

## 리펙토링을 위한 프로젝트 분석

이 섹션은 UI/UX 리펙토링을 진행하기 전, 현재 프로젝트의 구조와 기술 스택을 분석하고 기록하기 위해 작성되었습니다.

### 1. 프로젝트 개요

*   **목적**: 백엔드 개발자 강성욱의 개인 포트폴리오 웹사이트.
*   **기반 기술**: 정적 사이트 생성기인 **Jekyll**을 사용하여 구축되었으며, GitHub Pages를 통해 호스팅됩니다.
*   **주요 특징**: 채팅 형식의 인터랙티브 UI와 Chart.js를 활용한 기술 스택 시각화가 특징입니다.

### 2. 사용된 기술

*   **정적 사이트 생성**: Jekyll (`~> 4.3.0`)
*   **Jekyll 테마**: Minima (`~> 2.5`)
*   **스타일링**: SCSS (`assets/main.scss`)
*   **클라이언트 스크립트**: JavaScript (기능 구현), Chart.js (기술 스택 시각화)
*   **패키지 관리**: Bundler (`Gemfile`)
*   **배포**: Docker Compose (로컬 환경), GitHub Actions (GitHub Pages 배포)

### 3. 프로젝트 구조

```
.
├── _config.yml         # Jekyll 사이트 전체 설정 파일
├── _includes           # 페이지에 포함되는 HTML 조각 (header, footer 등)
│   ├── footer.html
│   ├── google-analytics.html
│   ├── head.html
│   └── header.html
├── _layouts            # 페이지의 전체적인 템플릿 (default, chat 등)
│   ├── chat.html
│   └── default.html
├── assets              # CSS, JS, 이미지 등 정적 파일
│   └── main.scss
├── images              # 포트폴리오에 사용되는 이미지 파일
├── pdf                 # 자격증 등 PDF 파일
├── .github/workflows   # GitHub Actions를 이용한 자동 배포 워크플로우
│   └── deploy.yml
├── index.md            # 메인 페이지 콘텐츠
├── about.md            # 소개 페이지 콘텐츠 (현재 사용되지 않는 것으로 보임)
├── Gemfile             # Ruby 의존성 관리 파일
└── README.md           # 프로젝트 설명 파일
```

### 4. 주요 페이지 및 콘텐츠

*   **`index.md`**: 사이트의 메인 페이지 역할을 하며, `chat.html` 레이아웃을 사용합니다. 대부분의 포트폴리오 정보(소개, 경력, 프로젝트 등)가 이 페이지 내에 스크립트로 동적으로 생성되는 구조로 보입니다.
*   **`_layouts/chat.html`**: 실제 콘텐츠가 표시되는 핵심 레이아웃 파일입니다. 채팅 UI와 상호작용 로직이 이 파일 또는 관련 스크립트에 포함되어 있을 가능성이 높습니다.
*   **`_config.yml`**: 사이트 제목, 설명, 저자 정보 등 주요 메타데이터가 정의되어 있습니다.

### 5. 배포 과정

*   **로컬 환경**: `docker-compose.yml` 파일을 통해 Jekyll 서버를 실행하여 로컬에서 테스트합니다. (`http://localhost:4000`)
*   **프로덕션 (GitHub Pages)**: `.github/workflows/deploy.yml`에 정의된 워크플로우에 따라, `main` 브랜치에 코드가 푸시되면 자동으로 빌드 및 GitHub Pages에 배포됩니다.

### 6. 리펙토링 방향 제안

*   **UI/UX 개선**: 현재 채팅 형식의 UI는 독특하지만, 정보 전달의 직관성이 다소 떨어질 수 있습니다. 보다 일반적인 포트폴리오 형식(예: 섹션별 스크롤 페이지)으로 변경하여 가독성을 높이는 것을 고려해볼 수 있습니다.
*   **코드 구조화**: 현재 대부분의 로직이 `chat.html` 또는 `index.md`에 집중되어 있을 가능성이 높습니다. 기능별로 JavaScript 파일을 분리하여 유지보수성을 향상시킬 수 있습니다.
*   **반응형 디자인**: 모바일 환경에서의 사용성을 검토하고 개선합니다.
