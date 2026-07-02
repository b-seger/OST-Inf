// =========================================================================
// Exam Summary Template — one chapter per lecture (modern edition)
// =========================================================================
// Usage:
//   1. Fill in the document metadata below.
//   2. For each lecture, copy a `#lecture(...)` block and fill it in.
//   3. Use the helper functions (#def, #note, #cmd, #important, #qa,
//      #knowledge-check) inside a lecture body to keep formatting consistent.
//   4. Compile with: typst compile summary.typ
// =========================================================================

// --- Palette ---------------------------------------------------------------
#let ink = rgb("#1A1C23")   // primary text
#let muted = rgb("#6B7280")   // secondary text / captions
#let hairline = rgb("#E4E6EB")   // hairline borders
#let accent = rgb("#3454D1")   // primary accent (indigo)
#let accent-soft = rgb("#EEF1FD")   // tinted background
#let warn = rgb("#B45309")   // amber, for "important"
#let warn-soft = rgb("#FDF3E7")
#let mono-bg = rgb("#F5F5F7")   // code/command background

// --- Fonts (with sensible fallbacks) ---------------------------------------
#let sans-font = "PT Sans"
#let mono-font = "DejaVu Sans Mono"

// --- Document setup ---------------------------------------------------------
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
    margin: (top: 2.4cm, bottom: 2.4cm, left: 2.2cm, right: 2.2cm),
    numbering: "1",
    header: context {
      if counter(page).get().first() > 1 {
        set text(size: 8.5pt, fill: muted, font: sans-font)
        title
        h(1fr)
        subtitle
        v(-0.3em)
        line(length: 100%, stroke: 0.5pt + hairline)
      } else {
        []
      }
    },
    footer: context {
      set text(size: 8.5pt, fill: muted, font: sans-font)
      align(center)[#counter(page).display("1")]
    },
  )
  set text(font: sans-font, size: 10pt, lang: "en", fill: ink)
  set heading(numbering: "1.1")
  set par(justify: true, leading: 0.65em)

  // --- Heading styling ---
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(1.2cm)
    context {
      let body-text = if it.numbering == none {
        it.body
      } else {
        let num = counter(heading).get().first()
        text(fill: muted, size: 9pt, tracking: 1.5pt)[LECTURE #num]
      }
      if it.numbering != none {
        body-text
        v(0.35em)
      }
    }
    text(size: 23pt, weight: "bold", fill: ink)[#it.body]
    v(0.6em)
    line(length: 100%, stroke: 1pt + accent)
    v(1em)
  }

  show heading.where(level: 2): it => {
    v(1.1em)
    context {
      let nums = counter(heading).get()
      box(width: 4pt, height: 4pt, fill: accent, radius: 2pt)
      h(0.4em)
      text(size: 12.5pt, weight: "bold", fill: ink)[
        #nums.at(0).#nums.at(1) #h(0.3em) #it.body
      ]
    }
    v(0.5em)
  }

  show heading.where(level: 3): it => {
    v(0.7em)
    text(size: 10.5pt, weight: "bold", fill: accent.darken(10%))[#it.body]
    v(0.3em)
  }

  // --- Title page ---
  set page(numbering: none)
  v(4cm)
  text(size: 9pt, fill: muted, tracking: 2pt)[SUMMARY]
  v(0.4em)
  text(size: 30pt, weight: "bold", fill: ink)[#title]
  v(0.2em)
  text(size: 14pt, fill: muted)[#subtitle]
  v(1.5cm)
  line(length: 30%, stroke: 1pt + accent)
  v(1cm)
  if author != "" {
    text(size: 11pt, fill: ink)[#author]
    linebreak()
  }
  text(size: 10pt, fill: muted)[#date.display("[day].[month].[year]")]

  v(2cm)
  show outline.entry.where(level: 1): it => {
    v(0.6em, weak: true)
    text(weight: "bold")[#it]
  }
  outline(title: text(size: 10pt, tracking: 1.5pt, fill: muted)[CONTENTS], indent: auto)

  pagebreak()
  set page(numbering: "1")
  counter(page).update(1)

  body
}

// --- Lecture / chapter wrapper ----------------------------------------------
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
      fill: white,
      inset: 12pt,
      radius: 3pt,
      stroke: (left: 2pt + accent, rest: 0.5pt + hairline),
    )[
      #text(size: 8.5pt, fill: accent, weight: "bold", tracking: 1pt)[LEARNING OBJECTIVES]
      #v(0.5em)
      #for (i, o) in learning-objectives.enumerate() {
        grid(
          columns: (10pt, 1fr),
          column-gutter: 6pt,
          row-gutter: 5pt,
          text(fill: accent, weight: "bold")[#(i + 1).], [#o],
        )
        v(2pt)
      }
    ]
    v(0.6em)
  }

  body
}

// --- Inline helpers ----------------------------------------------------------

// Definition: a term with its explanation
#let def(term, body) = {
  block(
    width: 100%,
    fill: accent-soft,
    inset: 10pt,
    radius: 3pt,
    above: 0.6em,
    below: 0.6em,
  )[
    #text(weight: "bold", fill: accent.darken(10%))[#term] --- #body
  ]
}

// Note: a lightweight aside
#let note(body) = {
  block(
    width: 100%,
    inset: (left: 12pt, top: 8pt, bottom: 8pt, right: 10pt),
    stroke: (left: 2pt + muted),
    above: 0.6em,
    below: 0.6em,
  )[
    #text(size: 8.5pt, fill: muted, weight: "bold", tracking: 1pt)[NOTE]
    #v(0.2em)
    #text(fill: muted.darken(20%))[#body]
  ]
}

// Command / code snippet
#let cmd(body) = {
  block(
    width: 100%,
    fill: mono-bg,
    inset: 9pt,
    radius: 3pt,
    above: 0.6em,
    below: 0.6em,
  )[
    #text(font: mono-font, size: 9pt)[#body]
  ]
}

// Important: something exam-critical
#let important(body) = {
  block(
    width: 100%,
    fill: warn-soft,
    inset: 10pt,
    radius: 3pt,
    stroke: (left: 2pt + warn),
    above: 0.6em,
    below: 0.6em,
  )[
    #text(size: 8.5pt, fill: warn, weight: "bold", tracking: 1pt)[IMPORTANT]
    #v(0.2em)
    #body
  ]
}

#let comparison(title1, title2, comp1: (), comp2: ()) = {
  block(
    width: 100%,
    fill: accent-soft,
    inset: 10pt,
    radius: 4pt,
  )[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 16pt,
      [
        #text(weight: "bold")[#title1]
        #v(0.4em)
        #list(..comp1.map(p => [#p]), marker: text()[•], spacing: 0.5em)
      ],
      [
        #text(weight: "bold")[#title2]
        #v(0.4em)
        #list(..comp2.map(c => [#c]), marker: text()[•], spacing: 0.5em)
      ],
    )
  ]
  v(0.3em)
}

#let three-way-comparison(title1, title2, title3, comp1: (), comp2: (), comp3: ()) = {
  block(
    width: 100%,
    fill: accent-soft,
    inset: 10pt,
    radius: 4pt,
  )[
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 16pt,
      [
        #text(weight: "bold")[#title1]
        #v(0.4em)
        #list(..comp1.map(p => [#p]), marker: text()[•], spacing: 0.5em)
      ],
      [
        #text(weight: "bold")[#title2]
        #v(0.4em)
        #list(..comp2.map(c => [#c]), marker: text()[•], spacing: 0.5em)
      ],
      [
        #text(weight: "bold")[#title3]
        #v(0.4em)
        #list(..comp3.map(c => [#c]), marker: text()[•], spacing: 0.5em)
      ],
    )
  ]
  v(0.3em)
}

// Wraps a learning-objective string as a link to a knowledge-check question,
// if a matching id is given. Falls back to plain text otherwise.
#let obj(text, ref: none) = {
  if ref != none {
    link(label(ref))[#text]
  } else {
    text
  }
}

// --- Knowledge assessment questions -----------------------------------------
// Each question dict can now optionally include `id: "some-unique-id"`
// so it can be linked to from a learning objective.
#let knowledge-check(questions, title: "Knowledge Check", show-answers: true) = {
  v(0.8em)
  text(size: 12pt, weight: "bold", fill: ink)[#title]
  v(0.2em)
  line(length: 100%, stroke: 0.5pt + hairline)
  v(0.8em)

  for (i, item) in questions.enumerate() {
    let card = block(
      width: 100%,
      fill: white,
      stroke: 0.5pt + hairline,
      radius: 4pt,
      inset: 12pt,
      above: 0pt,
      below: 0.9em,
      breakable: false,
    )[
      #grid(
        columns: (20pt, 1fr),
        column-gutter: 8pt,
        align: horizon,
        box(
          width: 20pt,
          height: 20pt,
          radius: 10pt,
          fill: accent,
          align(center + horizon)[#text(size: 8.5pt, weight: "bold", fill: white)[#(i + 1)]],
        ),
        text(weight: "medium", fill: ink)[#item.q],
      )

      #if show-answers {
        v(0.6em)
        block(
          width: 100%,
          fill: accent-soft,
          inset: (left: 10pt, top: 7pt, bottom: 7pt, right: 10pt),
          radius: 3pt,
        )[
          #text(size: 7.5pt, fill: accent.darken(15%), weight: "bold", tracking: 1pt)[ANSWER]
          #v(0.25em)
          #text(fill: ink)[#item.a]
        ]
      }
    ]

    // Attach a label to this card if the question has an `id`
    if "id" in item {
      [#card#label(item.id)]
    } else {
      card
    }
  }
}

// Single question/answer pair for inline use outside a list
#let qa(question, answer, show-answer: true) = {
  knowledge-check(((q: question, a: answer),), title: none, show-answers: show-answer)
}


#let compare-table(headers, ..rows) = {
  table(
    columns: headers.len(),
    stroke: 0.5pt + gray,
    fill: (x, y) => if y == 0 { accent } else { if calc.even(y) { accent-soft } else { white } },
    ..headers.map(h => text(fill: white, weight: "bold")[#h]),
    ..rows.pos().flatten()
  )
  v(0.3em)
}
