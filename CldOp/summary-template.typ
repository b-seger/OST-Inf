// =========================================================================
// Exam Summary Template — one chapter per lecture
// =========================================================================
// Usage:
//   1. Fill in the document metadata below.
//   2. For each lecture, copy a `#lecture(...)` block and fill it in.
//   3. Use the helper functions (#def, #note, #cmd, #important) inside
//      a lecture body to keep formatting consistent.
//   4. Compile with: typst compile summary.typ
// =========================================================================

#let accent = rgb("#7A1C5B")        // headline accent color (purple/magenta)
#let light-accent = rgb("#F3E6EF")  // light background for boxes
#let mono-bg = rgb("#F4F4F4")       // background for code/commands
// --- Document setup -------------------------------------------------------
#let conf(
  title: "Course Summary",
  subtitle: "Exam Preparation",
  author: "",
  date: datetime.today(),
  body,
) = {
  set document(title: title, author: author)
  set page(
    paper: "a4",
    margin: (top: 2.2cm, bottom: 2.2cm, left: 2cm, right: 2cm),
    numbering: "1",
    header: context {
      if counter(page).get().first() > 1 {
        set text(size: 9pt, fill: gray)
        title
        h(1fr)
        subtitle
      } else {
        []
      }
    },
  )
  set text(font: "New Computer Modern", size: 10.5pt, lang: "en")
  set heading(numbering: "1.1")
  set par(justify: true, leading: 0.6em)

  // --- Heading styling ---
  show heading.where(level: 1): it => {
    if it.numbering == none {
      // Unnumbered level-1 headings (e.g. outline title) get a simpler style
      pagebreak(weak: true)
      block(width: 100%, above: 0pt, below: 1.2em)[
        #rect(width: 100%, height: 3pt, fill: accent)
        #v(0.4em)
        #text(size: 20pt, weight: "bold")[#it.body]
      ]
    } else {
      pagebreak(weak: true)
      block(width: 100%, above: 0pt, below: 1.2em)[
        #rect(width: 100%, height: 3pt, fill: accent)
        #v(0.4em)
        #context {
          let num = counter(heading).get().first()
          text(size: 20pt, weight: "bold", fill: accent)[#num.]
        }
        #h(0.4em)
        #text(size: 20pt, weight: "bold")[#it.body]
      ]
    }
  }
  show heading.where(level: 2): it => {
    v(0.8em)
    context {
      let nums = counter(heading).get()
      text(size: 13pt, weight: "bold", fill: accent.darken(10%))[
        #nums.at(0).#nums.at(1) #it.body
      ]
    }
    v(0.3em)
  }
  show heading.where(level: 3): it => {
    v(0.5em)
    text(size: 11pt, weight: "bold")[#it.body]
    v(0.2em)
  }

  // --- Title page ---
  set page(numbering: none)
  align(center)[
    #v(2cm)
    #text(size: 28pt, weight: "bold", fill: accent)[#title]
    #v(0.3em)
    #text(size: 16pt, fill: gray)[#subtitle]
    #v(1cm)
    #if author != "" [#text(size: 12pt)[#author] #linebreak()]
    #text(size: 11pt, fill: gray)[#date.display("[day].[month].[year]")]
  ]

  v(1.5cm)
  outline(title: "Contents", indent: auto)

  pagebreak()
  set page(numbering: "1")
  counter(page).update(1)

  body
}

// --- Lecture / chapter wrapper --------------------------------------------
// Each lecture = one top-level chapter (heading level 1).
// `learning-objectives` is optional but recommended for exam prep.
#let lecture(
  number: none,
  title: "",
  learning-objectives: (),
  body,
) = {
  [= #title]

  if learning-objectives.len() > 0 {
    block(
      width: 100%,
      fill: light-accent,
      inset: 10pt,
      radius: 4pt,
      stroke: (left: 3pt + accent),
    )[
      #text(weight: "bold", fill: accent)[Learning Objectives]
      #v(0.3em)
      #list(..learning-objectives.map(o => [#o]))
    ]
    v(0.5em)
  }

  body
}

// --- Helper boxes for consistent note-taking ------------------------------

// Definition box — for key terms
#let def(term, body) = {
  block(
    width: 100%,
    fill: white,
    stroke: (left: 4pt + accent, rest: 0.6pt + gray.lighten(40%)),
    inset: 10pt,
    radius: 2pt,
  )[
    #text(weight: "bold", fill: accent, size: 11pt)[#term]
    #v(0.3em)
    #body
  ]
  v(0.3em)
}
// Important / exam-relevant callout
#let important(body) = {
  block(
    width: 100%,
    fill: rgb("#FFF4E5"),
    stroke: (left: 3pt + rgb("#E8A33D")),
    inset: 8pt,
    radius: 3pt,
  )[
    #text(weight: "bold", fill: rgb("#B8791F"))[⚠ Exam-relevant: ] #body
  ]
  v(0.3em)
}

// Plain side-note (smaller, gray)
#let note(body) = {
  text(size: 9.5pt, fill: gray, style: "italic")[#body]
}

// Command / code snippet box (for kubectl, helm, git, etc.)
#let cmd(body) = {
  block(
    width: 100%,
    fill: mono-bg,
    inset: 8pt,
    radius: 3pt,
  )[
    #set text(font: "DejaVu Sans Mono", size: 9.5pt)
    #body
  ]
  v(0.3em)
}

// Compact comparison table helper: pass headers + rows of equal length
#let compare-table(headers, ..rows) = {
  table(
    columns: headers.len(),
    stroke: 0.5pt + gray,
    fill: (x, y) => if y == 0 { light-accent } else { white },
    ..headers.map(h => text(weight: "bold")[#h]),
    ..rows.pos().flatten()
  )
  v(0.3em)
}

// Color coding for the three pipeline categories a stage can belong to.
#let category-colors = (
  "Continuous Integration": rgb("#2E7D32"),
  "Continuous Deployment": rgb("#1565C0"),
  "Continuous Delivery": rgb("#7A1C5B"),
  "Continuous Feedback": rgb("#B8791F"),
)

// Process/lifecycle stage box — for sequential phases like the DevOps
// cycle (Plan, Code, Build, Test, Release, Deploy, Operate, Monitor).
// `tools` is optional; omit it if a stage has no tool list.
// `category` / `category2` are optional; a stage can belong to up to two
// of: "Continuous Integration", "Continuos Deployment", "Continuous
// Delivery", "Continuous Feedback" — each rendered as its own colored tag.
#let stage(number: none, name: "", category: none, category2: none, activities: (), tools: ()) = {
  let cat-tag(cat) = {
    let cat-color = category-colors.at(cat, default: gray)
    block(
      fill: cat-color.lighten(85%),
      stroke: 0.6pt + cat-color,
      radius: 8pt,
      inset: (x: 6pt, y: 3pt),
    )[#text(fill: cat-color.darken(20%), weight: "bold", size: 8pt)[#cat]]
  }

  block(
    width: 100%,
    fill: white,
    stroke: 0.6pt + gray,
    inset: 10pt,
    radius: 3pt,
    breakable: false,
  )[
    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 8pt,
      align: (left, left, right),
      if number != none {
        block(
          fill: accent,
          radius: 100%,
          width: 22pt,
          height: 22pt,
          align(center + horizon)[#text(fill: white, weight: "bold", size: 10pt)[#number]],
        )
      } else { [] },
      text(weight: "bold", fill: accent, size: 12pt)[#name],
      stack(
        dir: ltr,
        spacing: 4pt,
        ..(
          if category != none { (cat-tag(category),) } else { () }
        ),
        ..(
          if category2 != none { (cat-tag(category2),) } else { () }
        ),
      ),
    )
    #v(0.4em)
    #text(weight: "bold", size: 9.5pt)[Key Activities]
    #list(..activities.map(a => [#a]), marker: text(fill: accent)[•])
    #if tools.len() > 0 {
      v(0.2em)
      text(weight: "bold", size: 9.5pt)[Tools]
      v(0.15em)
      text(size: 9.5pt, fill: gray)[#tools.join(" · ")]
    }
  ]
  v(0.3em)
}

// Key-takeaway summary block, meant to close out a lecture chapter
#let takeaways(items) = {
  block(
    width: 100%,
    fill: light-accent,
    inset: 10pt,
    radius: 4pt,
  )[
    #text(weight: "bold", fill: accent)[Key Takeaways]
    #v(0.3em)
    #enum(..items.map(i => [#i]))
  ]
}

// Named-item list — for enumerating strategies/patterns/principles where
// each item has a short bold name followed by a one-line description.
// `items` is an array of (name, description) pairs.
// Optional `title` renders a small heading above the list.
#let strategy-list(items, title: none) = {
  block(
    width: 100%,
    fill: light-accent,
    inset: 10pt,
    radius: 4pt,
  )[
    #if title != none {
      text(weight: "bold", fill: accent, size: 10.5pt)[#title]
      v(0.5em)
    }
    #list(
      ..items.map(((name, desc)) => [#text(weight: "bold")[#name:] #desc]),
      marker: text(fill: accent)[•],
      spacing: 0.6em,
    )
  ]
  v(0.3em)
}
