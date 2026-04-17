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
  / 方向兴趣: 后端工程、分布式协作系统、AI Infrastructure
  / 课程与自学: 数据结构、计算机组成原理；持续学习操作系统、计算机网络
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
)[*面向学生创新组织的团队在线协作文档系统（类飞书文档，开发中），目标是支持多人实时协同编辑、版本管理与组织知识沉淀。*]
- 独立负责需求梳理、系统设计、原型实现与后端开发，正在推进项目从技术验证阶段走向可用版本。
- 后端使用 Go 设计文档服务与 API 层，围绕文档读写、版本管理与权限边界拆分核心模块，强调可维护性与后续扩展。
- 前端基于 TypeScript 搭建编辑器与协作界面原型，验证基础编辑、多人协同与版本查看等核心交互路径。
- 调研并尝试采用 YATA (Yet Another Transformation Approach) CRDT 算法处理并发编辑冲突，目标是保证多端状态收敛与协作一致性。
- 基于 PostgreSQL 设计文档、版本与权限模型，支持历史回溯、权限隔离与面向后续迭代的 Schema 扩展。
- 使用 Claude Code、Codex 等工具辅助原型验证、接口联调与文档整理，提高个人迭代效率。

== 组织经历

#work(
  title: "技术与运维组 组员",
  location: "山东省威海市",
  company: [#link("https://fusion-perception-group.notion.site/")[Fusion & Perception Group（学生创新组织）]],
  dates: dates-helper(start-date: "2025.11", end-date: "至今"),
)
- 参与组织内部技术学习、工具分享与协作流程建设，积累 Linux 环境、命令行工具与版本控制的日常实践经验。
- 结合 FPGWiki 的建设进展，持续整理需求、推进原型迭代，为后续组织内文档协作与知识沉淀做准备。
- 协助整理组织技术文档与基础设施相关资料，关注系统可用性、文档规范与成员协作效率。

== 技能概览
#[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    row-gutter: 0pt,
    skills-box(
      title: "语言与系统",
      side: "left",
      points: (
        "熟悉 Linux / Shell 开发环境，能够使用常用命令行工具和脚本处理日常开发、排障与自动化任务。",
        "主攻 Go，关注后端服务、存储设计与工程化实现。",
        "具备 TypeScript 开发经验，能够完成 Web 应用基础界面开发与前后端联调。",
      ),
    ),
    skills-box(
      title: "工程实践",
      side: "right",
      points: (
        "掌握 Git 基本协作流程，能够进行分支管理、提交整理与问题回溯。",
        "使用 PostgreSQL 进行数据建模，关注文档版本、权限边界与可扩展 Schema 设计。",
        "持续维护个人 GitHub 与技术博客，记录项目实现、工具链实践与学习过程。",
      ),
    ),
  )
]



== 竞赛与奖项
#awards-list(yaml("awards.yaml"))


== 附加信息
- *英语：* CET-4 / CET-6。
- *技术写作：* 持续维护个人博客，记录项目实现与学习笔记。
