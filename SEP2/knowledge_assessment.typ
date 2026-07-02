#import "summary-template.typ": *

#show: conf.with(
  title: "SEP2 FS26",
  subtitle: "Knowledge Assessment",
  author: "Björn Seger",
  date: datetime.today(),
)

#lecture(
  title: "Project Planning",
  learning-objectives: (
    obj("What are the names and contents of the four quadrants of documentation?", ref: "pp-q1"),
    obj("What are the differences between traditional and agile planning?", ref: "pp-q2"),
    obj("Which topics are typically covered within a project plan?", ref: "pp-q3"),
    obj("When is a project plan created and updated?", ref: "pp-q4"),
    obj("What is the focus of a project plan: long- or short-term planning?", ref: "pp-q5"),
    obj("What is the difference between project planning and project tracking?", ref: "pp-q6"),
    obj("What is the main purpose of time tracking?", ref: "pp-q7"),
    obj("What should be considered when preparing key figures (KPIs) for your project?", ref: "pp-q8"),
  ),
)[

  #pagebreak()

  #knowledge-check((
    (
      id: "pp-q1",
      q: [What are the names and contents of the four quadrants of documentation?],
      a: [
        + *Requirements* - What the customer wants.
          - Vision
          - Domain Model
          - User Stories
          - Use Cases
          - Use Case Diagram
          - Sequence Diagrams
          - Wireframes
          - Glossary
        + *Project Planning* - How we want to work.
          - Resources
          - Roles
          - Risks
          - Processes
          - Meetings
          - Phases
          - Iterations
          - Milestones
        + *Technical Solution* - What we built for the customer.
          - arc42
          - Coding Styles
          - CI/CD
          - Component Diagram
          - Class Diagrams
          - Deployment
          - User Documentation
          - Testing
        + *Project Tracking* - Our current state of work
          - Work Items
          - Time Tracking
          - Metrics
          - Meeting Minutes
          - Personal Reports
      ],
    ),
    (
      id: "pp-q2",
      q: [What are the differences between traditional and agile planning?],
      a: [
        #comparison(
          "Traditional",
          "Agile",
          comp1: (
            "Plan driven - Features are set, estimate cost and time",
            "Later changes are expensive ",
          ),
          comp2: (
            "Value driven - Features are dependant on cost and time",
            "Continuous delivery",
            "Later changes are expected",
          ),
        )
      ],
    ),
    (
      id: "pp-q3",
      q: [Which topics are typically covered within a project plan?],
      a: [
        - Scope
        - Resources
        - Schedule
        - Processes and Meetings
        - Organization and Roles
        - Risk Management
      ],
    ),
    (
      id: "pp-q4",
      q: [When is a project plan created and updated?],
      a: [
        Initial draft at the beginning of a software project, regular refinement during the entire Project
      ],
    ),
    (
      id: "pp-q5",
      q: [What is the focus of a project plan: long- or short-term planning?],
      a: [
        A project plan focuses on the long-term planning but contains short-term tasks.
      ],
    ),
    (
      id: "pp-q6",
      q: [What is the difference between project planning and project tracking?],
      a: [
        #comparison(
          "Project Planning",
          "Project Tracking",
          comp1: (
            "Focus on the desired state",
            "Describes, how you want to do Project Tracking",
          ),
          comp2: (
            "Focus on the actual state",
          ),
        )
      ],
    ),
    (
      id: "pp-q7",
      q: [What is the main purpose of time tracking?],
      a: [
        - *Transparency*: Seeing exactly where the budget is being spent
        - *Future Accuracy*: Using historical data to make better estimates for the next project
        - *Capacity Management*: Identifying if a team member is over encumbered or underutilized
      ],
    ),
    (
      id: "pp-q8",
      q: [What should be considered when preparing key figures (KPIs) for your project?],
      a: [
        - Easy to find for everyone
        - Understandable by everyone
        - Up to date
      ],
    ),
  ))
]

#lecture(
  title: "Agile Methodologies",
  learning-objectives: (
    obj("What are the four generations in software development processes?", ref: "am-q1"),
    obj("Can you name four issues of the 1st generation?", ref: "am-q2"),
    obj("What are the differences between 1st and 2nd, respectively 2nd and 3rd generation?", ref: "am-q3"),
    obj("Can you name at least three values of the \"Agile Manifesto\"?", ref: "am-q4"),
    obj("Can you name at least three core principles of the \"Agile Mindset\"?", ref: "am-q5"),
    obj("Which roles, events and artifacts does Scrum define?", ref: "am-q6"),
    obj("What parts are missing in Scrum – and why are they missing?", ref: "am-q7"),
  ),
)[

  #knowledge-check((
    (
      id: "am-q1",
      q: [What are the four generations in software development processes?],
      a: [
        + Waterfall
        + Iterative and incremental
        + Agile methodologies
        + Scaling Agile
      ],
    ),
    (
      id: "am-q2",
      q: [Can you name four issues of the 1st generation? _(Any four)_],
      a: [
        + The Waterfall model is *not ideal for complicated/complex* (categorization according to Stacey Complexity Model) *problems*
        + *Too much uncertainty* (Cone of Uncertainty): Making accurate estimates at the beginning of a project is near impossible
        + *Lack of feedback*: Waterfall has no feedback cycles, problems detected at the very end of a project are expensive to fix
        + *No parallelization*: Sequential work is slow and misses out on team communication
        + *Unused features*: Lack of feedback cycles and prioritization lead to features being implemented, that might be rarely/never used
        + *Knowledge loss* on handovers
        + *Missing autonomy*: missing attachment to the product leads to lower quality of the product
        + *Sacrificing Quality*: unrealistic estimates in the beginning leed to later stages (e.g. Implementation or Testing) being used to save time, again sacrificing quality
        + *Wrong conclusions*: lack of planning is being blamed for project failure, as a result even more time is being invested in Analysis and Design, amplifying the previously mentioned problems
      ],
    ),
    (
      id: "am-q3",
      q: [What are the differences between 1st and 2nd, respectively 2nd and 3rd generation?],
      a: [
        #three-way-comparison(
          "1st: Waterfall",
          "2nd: Iterative&Incremental",
          "3rd: Agile",
          comp1: (
            [*Independent and sequential steps*],
            [*Specialized teams* for every step],
          ),
          comp2: (
            [*Iterative and incremental steps*: not all of one thing at a time but a little of everything all the time],
            [*Fast feedback* through delivering working software after every iteration],
            [*Cross-functional teams* with fast communication ways],
          ),
          comp3: (
            [Everything in 2nd generation but make processes *slimmer and more flexible*],
            [Main focus on *delivering working software*],
          ),
        )

      ],
    ),
    (
      id: "am-q4",
      q: [Can you name at least three values of the "Agile Manifesto"? _(Any three)_],
      a: [
        + Highest priority is to *satisfy the customer*
        + Welcome *changing requirements*
        + Business people and developers mus *work together daily* throughout the project
        + Build projects around *motivated individuals*
        + *Face-to-face conversation* is the most efficient and effective way of communication
        + Working software is the *primary measure of progress*
        + A *constant pace* should be able to be maintained indefinitely
        + Continuous attention to *technical excellence* and good design enhances agility
        + *Simplicity* - maximizing the amount of work not done - is essential
        + The best architectures, requirements, and designs emerge from *self-organizing teams*
        + *Reflection* on efficiency and effectiveness and *adjusting* behavior accordingly is done at regular intervals
      ],
    ),
    (
      id: "am-q5",
      q: [Can you name at least three core principles of the "Agile Mindset"? _(Any three)_],
      a: [
        + Development is *incremental*
        + Development is *iterative*
        + Perform activities in *parallel*
        + *Roles blur*
        + Planning is *adaptive*
        + *Scope* can vary
        + *Requirements* can change
        + *Working software* as primary measure
      ],
    ),
    (
      id: "am-q6",
      q: [Which roles, events and artifacts does Scrum define?],
      a: [

        #three-way-comparison(
          "Roles",
          "Events",
          "Artifacts",
          comp1: (
            [*Independent and sequential steps*],
            [*Specialized teams* for every step],
          ),
          comp2: (
            [*Iterative and incremental steps*: not all of one thing at a time but a little of everything all the time],
            [*Fast feedback* through delivering working software after every iteration],
            [*Cross-functional teams* with fast communication ways],
          ),
          comp3: (
            [Everything in 2nd generation but make processes *slimmer and more flexible*],
            [Main focus on *delivering working software*],
          ),
        )


      ],
    ),
    (
      id: "am-q7",
      q: [What parts are missing in Scrum – and why are they missing?],
      a: [
        Any kind of *technical recommendations*. Scrum is intended to be a lightweight framework
      ],
    ),
  ))
]

#lecture(
  title: "Backlog Management",
  learning-objectives: (
    obj("What is the relationship between Project Planning and Backlog Management?", ref: "bm-q1"),
    obj("Why do we have multiple planning-levels in Agile Methodologies?", ref: "bm-q2"),
    obj("What are similarities and differences between Use Cases and the Agile Hierarchy?", ref: "bm-q3"),
    obj("What is the relationship between the Product/Sprint Backlog and an Issue Tracker?", ref: "bm-q4"),
    obj("Why is it important to prioritize a backlog?", ref: "bm-q5"),
    obj("Can you name three criteria or methods for prioritizing a backlog?", ref: "bm-q6"),
    obj("Can you name and describe three fundamentally different approaches for effort estimations?", ref: "bm-q7"),
    obj("Can you name two common units for relative estimations?", ref: "bm-q8"),
    obj("What are some of the benefits of Planning Poker?", ref: "bm-q9"),
  ),
)[

  #knowledge-check((
    (
      id: "bm-q1",
      q: [What is the relationship between Project Planning and Backlog Management?],
      a: [
        The Project Plan defines the framework in which the product is developed (Dates, Milestones, Iterations, Resources, etc.), during Backlog Management the Features *in* the Project Plan are defined
      ],
    ),
    (
      id: "bm-q2",
      q: [Why do we have multiple planning-levels in Agile Methodologies?],
      a: [
        *High-level / long-term* planning users rough scopes, coarse requirements and vague estimates.\
        The *Low-level / short-term* uses detailed scopes, fine-grained requirements and accurate estimates.

        Planning on the lower level is time consuming and might require adoption according to circumstances, this is bes done at a later time when it becomes relevant. The higher level defines a rough overview and the general direction the project should head.
      ],
    ),
    (
      id: "bm-q3",
      q: [What are similarities and differences between Use Cases and the Agile Hierarchy?],
      a: [
        *Similarity*: Both focus on users and their interactions with the system. The goal is to track *Functional Requirements*
        #comparison(
          "Use Cases",
          "Agile Hierarchy",
          comp1: (
            "Systematic approach with high formality",
            "Risk of \"Over Engineering\"",
            "UC Diagram → UC Brief →  UC Casual, UC Fully Dressed → Tasks/Work Items",
          ),
          comp2: (
            "Goal of Avoiding Waste",
            "Very informal",
            "Risk of \"Under Engineering\"",
            "Epics → User Stories → Tasks / Work Items",
          ),
        )
      ],
    ),
    (
      id: "bm-q4",
      q: [What is the relationship between the Product/Sprint Backlog and an Issue Tracker?],
      a: [
        A Product Backlog contains all the tasks being moved to the Sprint Backlog each iteration. The Issue Tracker visualizes this.
      ],
    ),
    (
      id: "bm-q5",
      q: [Why is it important to prioritize a backlog?],
      a: [
        In order to implement the most important functionalities first (MVP). Features can be added later.
      ],
    ),
    (
      id: "bm-q6",
      q: [Can you name three criteria or methods for prioritizing a backlog?],
      a: [
        - *Financial value* of having the feature
        - *Customer satisfaction* of having the feature
        - *Cost to develop* the new feature
        - *New knowledge* generated by the feature
        - *Amount of risk* to develop the feature
        - *Mitigation of risks* by the feature
      ],
    ),
    (
      id: "bm-q7",
      q: [Can you name and describe three fundamentally different approaches for effort estimations?],
      a: [
        #three-way-comparison(
          "MVP-Approach",
          "MoSCow",
          "Kano",
          comp1: (
            [Only 2 priority levels],
            [Features *mandatory* for the MVP are *high* priority],
            [All others get *low* priority],
          ),
          comp2: (
            [4 priority levels],
            [*Must* - Critical],
            [*Could* - Important],
            [*Should*- Desirable],
            [*Won't* - Not needed],
          ),
          comp3: (
            [*Threshold Attributes*\ Basic features that customers expect. Having a lot increases satisfaction only slightly],
            [*Performance Attributes*\ Not necessary, but welcome. Linear increase in satisfaction],
            [*Excitement Attributes*\ Surprise the customer. Huge impact on satisfaction],
          ),
        )
      ],
    ),
    (
      id: "bm-q8",
      q: [Can you name two common units for relative estimations?],
      a: [
        Story Points (1, 2, 3, 5, 8, 10, 20, ...) and T-Shirt Sizes (XS, S, M, L, ...)
      ],
    ),
    (
      id: "bm-q9",
      q: [What are some of the benefits of Planning Poker?],
      a: [
        - *Avoids influence* of other participants
        - *Emphasizes discussion* about requirements
        - Good *tool-support*
        - Works for both Relative and Absolute estimates
      ],
    ),
  ))
]

#lecture(
  title: "Quality",
  learning-objectives: (
    obj("What does \"good quality\" in terms of software mean?", ref: "qu-q1"),
    obj("What are the three steps of the \"general approach\" for managing the quality?", ref: "qu-q2"),
    obj("Which are the two types of requirements?", ref: "qu-q3"),
    obj("What might happen if you forget to specify requirements for your product?", ref: "qu-q4"),
    obj("What will happen to quality over time, if you do not manage it rigorously?", ref: "qu-q5"),
    obj("Can you name 3 quality measures for each category: Processes, Practices and Tools?", ref: "qu-q6"),
    obj("What are \"Engineering Metrics\" used for?", ref: "qu-q7"),
    obj("What are some of the risks of using \"Engineering Metrics\"?", ref: "qu-q8"),
  ),
)[

  #knowledge-check((
    (
      id: "qu-q1",
      q: [What does "good quality" in terms of software mean?],
      a: [
        *Quality is the capability of a software product to conform to requirements.*
        - User view: Correct and Reliable, User Friendly, Efficient, Secure
        - Developer view: Maintainable, Testable, Extendable, Reusable
      ],
    ),
    (
      id: "qu-q2",
      q: [What are the three steps of the "general approach" for managing the quality?],
      a: [
        + Identify Requirements
        + Define Quality Measures
        + Inspect and Adapt
      ],
    ),
    (
      id: "qu-q3",
      q: [Which are the two types of requirements?],
      a: [
        + *Functional*: Acquired with customer and easy to verify
        + *Non-functional*: Defined by the customer and developers, harder to verify
      ],
    ),
    (
      id: "qu-q4",
      q: [What might happen if you forget to specify requirements for your product?],
      a: [
        The project will lack a clear definition of quality.

        _You can't control what you can't measure_
      ],
    ),
    (
      id: "qu-q5",
      q: [What will happen to quality over time, if you do not manage it rigorously?],
      a: [
        Quality will decrease and software becomes stale.
        - Accepting bugs will lead to more bugs.
        - If bad code is introduced, it will be copied
        - If a review is skipped, it will be skipped next time
        - ...
      ],
    ),
    (
      id: "qu-q6",
      q: [Can you name 3 quality measures for each category: Processes, Practices and Tools?],
      a: [
        #three-way-comparison(
          "Processes",
          "Practices",
          "Tools",
          comp1: ([Sprint Reviews], [Technical Debt], [Risk Management]),
          comp2: ([Engineering Metrics], [Clean Code], [Reviews]),
          comp3: ([Arc42], [Dashboards], [Issue Trackers]),
        )
      ],
    ),
    (
      id: "qu-q7",
      q: [What are "Engineering Metrics" used for?],
      a: [
        Measuring software properties.
      ],
    ),
    (
      id: "qu-q8",
      q: [What are some of the risks of using "Engineering Metrics"?],
      a: [
        - *Using metrics as proof*: Metrics are indicators (e.g. 100% code coverage does not imply well written tests)
        - *Unreasonable scale*
        - *Using metrics to blame somebody*: Metrics are supposed to help, _not_ cause fights
        - *Using metrics to reward somebody*: People will find ways to manipulate metrics to their advantage

      ],
    ),
  ))
]

#lecture(
  title: "Software Architecture",
  learning-objectives: (
    obj("What is the main goal of a software architecture?", ref: "sa-q1"),
    obj("What are the differences between architecture, design and code?", ref: "sa-q2"),
    obj("What is a component? Why are these important for this topic?", ref: "sa-q3"),
    obj("What factors do have an impact on the resulting architecture?", ref: "sa-q4"),
    obj("What is more important: functionality or structure? Why?", ref: "sa-q5"),
    obj("What are some of the responsibilities of a software architect?", ref: "sa-q6"),
    obj("What are some of the skills a software architect should possess?", ref: "sa-q7"),
    obj("What are important things to consider when documenting any software architecture?", ref: "sa-q8"),
    obj("What are some of the commonly known templates for documenting a software architecture?", ref: "sa-q9"),
  ),
)[

  #knowledge-check((
    (id: "sa-q1", q: [What is the main goal of a software architecture?], a: [-]),
    (id: "sa-q2", q: [What are the differences between architecture, design and code?], a: [-]),
    (id: "sa-q3", q: [What is a component? Why are these important for this topic?], a: [-]),
    (id: "sa-q4", q: [What factors do have an impact on the resulting architecture?], a: [-]),
    (id: "sa-q5", q: [What is more important: functionality or structure? Why?], a: [-]),
    (id: "sa-q6", q: [What are some of the responsibilities of a software architect?], a: [-]),
    (id: "sa-q7", q: [What are some of the skills a software architect should possess?], a: [-]),
    (id: "sa-q8", q: [What are important things to consider when documenting any software architecture?], a: [-]),
    (id: "sa-q9", q: [What are some of the commonly known templates for documenting a software architecture?], a: [-]),
  ))
]

#lecture(
  title: "Software Craftsmanship",
  learning-objectives: (
    obj("What problem is described with the term \"Agile Hangover\"?", ref: "sc-q1"),
    obj("Can you name at least three values that Software Craftsmen should possess?", ref: "sc-q2"),
    obj("Why and when is it important to say YES / NO?", ref: "sc-q3"),
    obj("Can you name at least three best practices related to coding?", ref: "sc-q4"),
    obj("Can you name at least three best practices related to time management?", ref: "sc-q5"),
    obj("Why is it mandatory to continually practice the art of software engineering?", ref: "sc-q6"),
    obj("What is the relationship between Coding Katas and Coding Dojos?", ref: "sc-q7"),
    obj("What is the relationship between Pair Programming and Rubber Duck Debugging?", ref: "sc-q8"),
  ),
)[

  #knowledge-check((
    (id: "sc-q1", q: [What problem is described with the term "Agile Hangover"?], a: [-]),
    (id: "sc-q2", q: [Can you name at least three values that Software Craftsmen should possess?], a: [-]),
    (id: "sc-q3", q: [Why and when is it important to say YES / NO?], a: [-]),
    (id: "sc-q4", q: [Can you name at least three best practices related to coding?], a: [-]),
    (id: "sc-q5", q: [Can you name at least three best practices related to time management?], a: [-]),
    (id: "sc-q6", q: [Why is it mandatory to continually practice the art of software engineering?], a: [-]),
    (id: "sc-q7", q: [What is the relationship between Coding Katas and Coding Dojos?], a: [-]),
    (id: "sc-q8", q: [What is the relationship between Pair Programming and Rubber Duck Debugging?], a: [-]),
  ))
]

#lecture(
  title: "Clean Code",
  learning-objectives: (
    obj("Can you give a definition for the term \"clean code\"?", ref: "cc-q1"),
    obj("Why is it very important to produce clean code right from the beginning of a project?", ref: "cc-q2"),
    obj("What is the \"Boy Scout Rule\"?", ref: "cc-q3"),
    obj(
      "Can you name at least 3 [positive / negative] characteristics of [naming / functions / classes]?",
      ref: "cc-q4",
    ),
    obj("What is the relationship between cohesion and coupling?", ref: "cc-q5"),
    obj("How does observing the \"Law of Demeter\" reduce coupling?", ref: "cc-q6"),
    obj("When should you use comments in your code? When not to?", ref: "cc-q7"),
    obj("What are important criteria when talking about \"formatting\" your code?", ref: "cc-q8"),
    obj("What do the acronyms YAGNI, KISS and ETC stand for?", ref: "cc-q9"),
    obj("Can you name and explain all five design principles included in SOLID?", ref: "cc-q10"),
    obj("Can you name at least two other design principles not included in SOLID?", ref: "cc-q11"),
    obj("What does TDD stand for?", ref: "cc-q12"),
    obj("What is the main purpose of TDD?", ref: "cc-q13"),
    obj("Why are unit tests created with TDD generally cleaner than unit tests created without TDD?", ref: "cc-q14"),
    obj("What are the limits of TDD?", ref: "cc-q15"),
  ),
)[

  #knowledge-check(
    title: "Knowledge Check (1)",
    (
      (id: "cc-q1", q: [Can you give a definition for the term "clean code"?], a: [-]),
      (id: "cc-q2", q: [Why is it very important to produce clean code right from the beginning of a project?], a: [-]),
      (id: "cc-q3", q: [What is the "Boy Scout Rule"?], a: [-]),
      (
        id: "cc-q4",
        q: [Can you name at least 3 [positive / negative] characteristics of [naming / functions / classes]?],
        a: [-],
      ),
      (id: "cc-q5", q: [What is the relationship between cohesion and coupling?], a: [-]),
      (id: "cc-q6", q: [How does observing the "Law of Demeter" reduce coupling?], a: [-]),
      (id: "cc-q7", q: [When should you use comments in your code? When not to?], a: [-]),
      (id: "cc-q8", q: [What are important criteria when talking about "formatting" your code?], a: [-]),
    ),
  )

  #knowledge-check(
    title: "Knowledge Check (2)",
    (
      (id: "cc-q9", q: [What do the acronyms YAGNI, KISS and ETC stand for?], a: [-]),
      (id: "cc-q10", q: [Can you name and explain all five design principles included in SOLID?], a: [-]),
      (id: "cc-q11", q: [Can you name at least two other design principles not included in SOLID?], a: [-]),
      (id: "cc-q12", q: [What does TDD stand for?], a: [-]),
      (id: "cc-q13", q: [What is the main purpose of TDD?], a: [-]),
      (
        id: "cc-q14",
        q: [Why are unit tests created with TDD generally cleaner than unit tests created without TDD?],
        a: [-],
      ),
      (id: "cc-q15", q: [What are the limits of TDD?], a: [-]),
    ),
  )
]

#lecture(
  title: "Reviews",
  learning-objectives: (
    obj("Can you give a definition for the term \"Review\"?", ref: "rv-q1"),
    obj("Why are reviews important in software development?", ref: "rv-q2"),
    obj("Can you name and explain the four basic principles for doing reviews?", ref: "rv-q3"),
    obj("Can you name and explain at least three process-oriented review techniques?", ref: "rv-q4"),
    obj("Can you name and explain at least three code-oriented review techniques?", ref: "rv-q5"),
  ),
)[

  #knowledge-check((
    (id: "rv-q1", q: [Can you give a definition for the term "Review"?], a: [-]),
    (id: "rv-q2", q: [Why are reviews important in software development?], a: [-]),
    (id: "rv-q3", q: [Can you name and explain the four basic principles for doing reviews?], a: [-]),
    (id: "rv-q4", q: [Can you name and explain at least three process-oriented review techniques?], a: [-]),
    (id: "rv-q5", q: [Can you name and explain at least three code-oriented review techniques?], a: [-]),
  ))
]

#lecture(
  title: "Testing",
  learning-objectives: (
    obj("Complete this sentence from Pragmatic Programmers: \"Test _____, Test _____, Test _____.\"", ref: "te-q1"),
    obj("Why is the \"Swiss Cheese Model\" relevant for Testing?", ref: "te-q2"),
    obj("Can you draw the \"Test Pyramid\" and explain all levels of it?", ref: "te-q3"),
    obj("Can you name two Anti Patterns in Testing?", ref: "te-q4"),
    obj("What is ATDD / BDD? How is it different from TDD?", ref: "te-q5"),
    obj("Can you name and explain at least three Additional Techniques?", ref: "te-q6"),
    obj("Who is responsible for testing in Scrum?", ref: "te-q7"),
    obj("Why might it be useful to have a dedicated tester in your team?", ref: "te-q8"),
    obj("What are some of the topics that should be covered in a Test Concept?", ref: "te-q9"),
  ),
)[

  #knowledge-check((
    (
      id: "te-q1",
      q: [Complete this sentence from Pragmatic Programmers: "Test `_____` , Test `_____`  , Test `_____` ."],
      a: [-],
    ),
    (id: "te-q2", q: [Why is the "Swiss Cheese Model" relevant for Testing?], a: [-]),
    (id: "te-q3", q: [Can you draw the "Test Pyramid" and explain all levels of it?], a: [-]),
    (id: "te-q4", q: [Can you name two Anti Patterns in Testing?], a: [-]),
    (id: "te-q5", q: [What is ATDD / BDD? How is it different from TDD?], a: [-]),
    (id: "te-q6", q: [Can you name and explain at least three Additional Techniques?], a: [-]),
    (id: "te-q7", q: [Who is responsible for testing in Scrum?], a: [-]),
    (id: "te-q8", q: [Why might it be useful to have a dedicated tester in your team?], a: [-]),
    (id: "te-q9", q: [What are some of the topics that should be covered in a Test Concept?], a: [-]),
  ))
]

#lecture(
  title: "Design Patterns",
  learning-objectives: (
    obj("What is a Design Pattern?", ref: "dp-q1"),
    obj("Is it possible to apply Design Patterns out-of-the-box?", ref: "dp-q2"),
    obj("What are the differences between Design Patterns and a Design Principles?", ref: "dp-q3"),
    obj("What are the GoF-Design Patterns?", ref: "dp-q4"),
    obj(
      "For each Behavioral Pattern (Observer, State, Strategy, Template Method): Can you give an example what it is used for?",
      ref: "dp-q5",
    ),
    obj(
      "For each Behavioral Pattern: Can you draw a diagram and explain the main components and its interactions?",
      ref: "dp-q6",
    ),
    obj(
      "For each Creational Pattern (Abstract Factory, Factory Method, Singleton): Can you give an example what it is used for?",
      ref: "dp-q7",
    ),
    obj(
      "For each Creational Pattern: Can you draw a diagram and explain the main components and its interactions?",
      ref: "dp-q8",
    ),
    obj(
      "For each Structural Pattern (Adapter, Decorator, Facade, Proxy): Can you give an example what it is used for?",
      ref: "dp-q9",
    ),
    obj(
      "For each Structural Pattern: Can you draw a diagram and explain the main components and its interactions?",
      ref: "dp-q10",
    ),
    obj("What is \"Dependency Injection\"?", ref: "dp-q11"),
    obj("Why is \"Dependency Injection\" important for decoupling code?", ref: "dp-q12"),
    obj("What can a \"Null Object\" be used for?", ref: "dp-q13"),
    obj("With what Design Pattern(s) is the \"Null Object\" typically combined with?", ref: "dp-q14"),
    obj("What is the difference between the \"Simple Factory\" and the \"Abstract Factory\"?", ref: "dp-q15"),
  ),
)[

  #knowledge-check(
    title: "Knowledge Check (1) – Fundamentals & Behavioral Patterns",
    (
      (id: "dp-q1", q: [What is a Design Pattern?], a: [-]),
      (id: "dp-q2", q: [Is it possible to apply Design Patterns out-of-the-box?], a: [-]),
      (id: "dp-q3", q: [What are the differences between Design Patterns and a Design Principles?], a: [-]),
      (id: "dp-q4", q: [What are the GoF-Design Patterns?], a: [-]),
      (
        id: "dp-q5",
        q: [Behavioral Patterns: Observer, State, Strategy and Template Method — for each pattern, can you give an example what it is used for?],
        a: [-],
      ),
      (
        id: "dp-q6",
        q: [Behavioral Patterns: for each pattern, can you draw a diagram and explain the main components and its interactions?],
        a: [-],
      ),
    ),
  )

  #knowledge-check(
    title: "Knowledge Check (2) – Creational & Structural Patterns",
    (
      (
        id: "dp-q7",
        q: [Creational Patterns: Abstract Factory, Factory Method and Singleton — for each pattern, can you give an example what it is used for?],
        a: [-],
      ),
      (
        id: "dp-q8",
        q: [Creational Patterns: for each pattern, can you draw a diagram and explain the main components and its interactions?],
        a: [-],
      ),
      (
        id: "dp-q9",
        q: [Structural Patterns: Adapter, Decorator, Facade and Proxy — for each pattern, can you give an example what it is used for?],
        a: [-],
      ),
      (
        id: "dp-q10",
        q: [Structural Patterns: for each pattern, can you draw a diagram and explain the main components and its interactions?],
        a: [-],
      ),
    ),
  )

  #knowledge-check(
    title: "Knowledge Check (3) – Important Non-GoF Patterns",
    (
      (id: "dp-q11", q: [What is "Dependency Injection"?], a: [-]),
      (id: "dp-q12", q: [Why is "Dependency Injection" important for decoupling code?], a: [-]),
      (id: "dp-q13", q: [What can a "Null Object" be used for?], a: [-]),
      (id: "dp-q14", q: [With what Design Pattern(s) is the "Null Object" typically combined with?], a: [-]),
      (id: "dp-q15", q: [What is the difference between the "Simple Factory" and the "Abstract Factory"?], a: [-]),
    ),
  )
]

#lecture(
  title: "Cleaning Code",
  learning-objectives: (
    obj("Can you explain the following terms: Refactoring? Tidying? Reverse Engineering?", ref: "clc-q1"),
    obj("Can you name three reasons to clean code?", ref: "clc-q2"),
    obj("What is the relationship between Code Smells and Refactorings / Tidyings?", ref: "clc-q3"),
    obj("What is the relationship between Code Smells and Anti Patterns?", ref: "clc-q4"),
    obj("What are the three basic rules for cleaning code?", ref: "clc-q5"),
    obj("When is the right time to cleanup your code?", ref: "clc-q6"),
    obj("What is the biggest challenge when dealing with Legacy Code?", ref: "clc-q7"),
    obj("Can you describe a systematic approach of how to deal with Legacy Code?", ref: "clc-q8"),
  ),
)[

  #knowledge-check((
    (id: "clc-q1", q: [Can you explain the following terms: Refactoring? Tidying? Reverse Engineering?], a: [-]),
    (id: "clc-q2", q: [Can you name three reasons to clean code?], a: [-]),
    (id: "clc-q3", q: [What is the relationship between Code Smells and Refactorings / Tidyings?], a: [-]),
    (id: "clc-q4", q: [What is the relationship between Code Smells and Anti Patterns?], a: [-]),
    (id: "clc-q5", q: [What are the three basic rules for cleaning code?], a: [-]),
    (id: "clc-q6", q: [When is the right time to cleanup your code?], a: [-]),
    (id: "clc-q7", q: [What is the biggest challenge when dealing with Legacy Code?], a: [-]),
    (id: "clc-q8", q: [Can you describe a systematic approach of how to deal with Legacy Code?], a: [-]),
  ))
]

#lecture(
  title: "Agile Methodologies (Continued)",
  learning-objectives: (
    obj("Can you name three missing parts in Scrum?", ref: "amc-q1"),
    obj("Can you name at least four PM-tasks in a software development project?", ref: "amc-q2"),
    obj("Who is responsible for these PM-Tasks in Scrum?", ref: "amc-q3"),
    obj("How can developers support their PM?", ref: "amc-q4"),
    obj("What is an easy way to scale Scrum?", ref: "amc-q5"),
    obj("Can you name at least two scaling frameworks?", ref: "amc-q6"),
    obj("Can you name at least two principles and two practices in Kanban?", ref: "amc-q7"),
    obj("How is Kanban different from Scrum?", ref: "amc-q8"),
  ),
)[

  #knowledge-check((
    (id: "amc-q1", q: [Can you name three missing parts in Scrum?], a: [-]),
    (id: "amc-q2", q: [Can you name at least four PM-tasks in a software development project?], a: [-]),
    (id: "amc-q3", q: [Who is responsible for these PM-Tasks in Scrum?], a: [-]),
    (id: "amc-q4", q: [How can developers support their PM?], a: [-]),
    (id: "amc-q5", q: [What is an easy way to scale Scrum?], a: [-]),
    (id: "amc-q6", q: [Can you name at least two scaling frameworks?], a: [-]),
    (id: "amc-q7", q: [Can you name at least two principles and two practices in Kanban?], a: [-]),
    (id: "amc-q8", q: [How is Kanban different from Scrum?], a: [-]),
  ))
]
