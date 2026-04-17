#import "@preview/basic-resume:0.2.9": *
#let sub(
  it,
) = {
  v(-.65em)
  it
  v(-.65em)
  line(stroke: (paint: gray, cap: "round", thickness: .5pt), length: 42%)
}


#let awards-list(awards) = {
  // set table(stroke: 1pt)
  set table(stroke: none)
  set text(size: 9pt)
  set align(center)
  table(
    align: (left, center, left),
    columns: (1fr, auto, auto),
    ..for award in awards {
      (award.name, [#award.role｜#award.level], str(award.date))
    },
  )
}

#let skills-box(title: none, points: (), side: "left") = {
  let accent = rgb("#B52323")
  block(
    width: 100%,
    height: 120pt,
    fill: rgb("#FAFAFA"),
    stroke: (left: 3pt + accent),
    inset: (x: 10pt, y: 8pt),
    radius: (right: 3pt),
    breakable: false,
  )[
    #set par(justify: false)
    #set text(size: 8pt)
    #text(weight: 900, size: 9.5pt, fill: accent)[#title]
    #v(2pt)
    #line(length: 100%, stroke: .3pt + gray)
    #v(3pt)
    #for point in points [
      #grid(
        columns: (8pt, 1fr),
        column-gutter: 2pt,
        text(fill: accent, weight: 700)[▸],
        [#point],
      )
      #v(1pt)
    ]
  ]
}

// Put your personal information here, replacing mine
// #let name = "Jianhao Wu"
#let name = "石静远"
#let phone = "+86 17716945809"
#let location = "山东省威海市"
#let email = "shijingyuan061010@gmail.com"
#let github = "github.com/JasperStonnne"
#let linkedin = none
#let personal-site = "jasperstonnne.github.io"

#show: resume.with(
  author: name,
  // All the lines below are optional.
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  location: location,
  email: email,
  github: github,
  // linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#B52323",
  font: ("New Computer Modern", "KaiTi"),
  paper: "a4",
  author-position: left,
  personal-info-position: left,
)



/*
 * Lines that start with == are formatted into section headings
 * You can use the specific formatting functions if needed
 * The following formatting functions are listed below
 * #edu(dates: "", degree: "", gpa: "", institution: "", location: "")
 * #work(company: "", dates: "", location: "", title: "")
 * #project(dates: "", name: "", role: "", url: "")
 * #extracurriculars(activity: "", dates: "")
 * There are also the following generic functions that don't apply any formatting
 * #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
 * #generic-one-by-two(left: "", right: "")
 */
== 教育背景

#edu(
  institution: "山东大学（威海）| 985/211，双一流",
  location: "山东省威海市",
  dates: dates-helper(start-date: "2025.09", end-date: "2029.06"),
  degree: [*计算机科学与技术* 在读],
  consistent: true,
)
#[
  #set terms(hanging-indent: 0em)
  / 方向兴趣: Web 前端工程、富交互界面、协同编辑器、AI 应用前端
  / 课程与自学: 数据结构、计算机组成原理；持续学习计算机网络、操作系统、JavaScript / TypeScript 与浏览器基础
]


== 项目经历
#project(
  role: "负责人",
  name: "FPGWiki",
  dates: dates-helper(start-date: "2025.11", end-date: "至今"),
)
#sub[_Fusion & Perception Group_]
#v(-7pt)
#text(
  size: 10pt,
)[*面向学生创新组织的团队在线协作文档系统（类飞书文档，开发中），目标支持多人实时编辑、目录组织、版本查看与知识沉淀。*]
- 独立负责需求梳理、交互流程设计、原型实现与前后端联调，持续推进协作文档系统从原型走向可用版本。
- 前端基于 TypeScript 搭建编辑器与协作界面原型，围绕文档编辑、目录导航、版本查看等场景设计页面结构与交互流程。
- 按编辑器、文档目录、版本视图等功能拆分前端模块，并完成接口对接与状态同步相关验证，关注代码可维护性与后续扩展。
- 调研并尝试采用 YATA (Yet Another Transformation Approach) CRDT 算法处理并发编辑冲突，理解多人协同编辑下前端状态同步与交互一致性问题。
- 后端使用 Go 设计文档服务与 API 层，并基于 PostgreSQL 组织文档、版本与权限数据，支撑前端原型联调与功能验证。
- 使用 Claude Code、Codex 等工具辅助原型验证、接口联调与文档整理，提高个人迭代效率。

== 组织经历

#work(
  title: "技术与运维组 组员",
  location: "山东省威海市",
  company: [#link("https://fusion-perception-group.notion.site/")[Fusion & Perception Group（学生创新组织）]],
  dates: dates-helper(start-date: "2025.11", end-date: "至今"),
)
- 参与组织内部技术学习、工具分享与协作流程建设，积累 Linux、Git 与命令行工具的日常工程实践经验。
- 结合 FPGWiki 的建设进展，持续整理协作文档场景需求，推进页面原型、文档结构与版本查看流程的迭代。
- 协助整理组织技术文档与基础设施相关资料，关注信息组织、文档可读性与成员协作体验。

== 技能概览
#[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    row-gutter: 0pt,
    skills-box(
      title: "前端与 Web 基础",
      side: "left",
      points: (
        "熟悉 HTML / CSS / JavaScript / TypeScript 基础，能够完成常见页面结构、样式编写与交互逻辑实现。",
        "能够进行前后端联调、异步请求处理与基础 Web 原型开发，具备编辑器与协作界面实现经验。",
        "熟悉 Linux / Shell 开发环境，能够使用命令行工具与脚本辅助开发、排障与自动化处理。",
      ),
    ),
    skills-box(
      title: "工程实践与方向",
      side: "right",
      points: (
        "掌握 Git 基本协作流程，关注模块拆分、代码可维护性与迭代效率。",
        "关注富交互界面、协同编辑、性能体验与前端工程化问题，持续学习相关实现方案。",
        "持续维护个人 GitHub 与技术博客，记录项目实现、前端实践与工具链学习过程。",
      ),
    ),
  )
]



== 竞赛与奖项
#awards-list(yaml("awards.yaml"))


== 附加信息
- *英语：* CET-4 / CET-6。
- *技术写作：* 持续维护个人博客，记录项目实现与学习笔记。
