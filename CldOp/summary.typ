#import "summary-template.typ": *

#show: conf.with(
  title: "Cloud Operations FS26",
  subtitle: "Exam Summary",
  author: "Björn Seger",
  date: datetime.today(),
)

// ===========================================================================
// Lecture 1 — Introduction to Cloud Operations
// ===========================================================================
#lecture(
  title: "Introduction to Cloud Operations",
  learning-objectives: (
    "Understand the concept of DevOps, CI/CD, and Platform Engineering",
    "Describe all stages of the DevOps cycle",
    "Associate activities with DevOps cycle stages",
    "Understand the relationship between DevOps, CI/CD, and Platform Engineering",
  ),
)[

  == DevOps

  #def("DevOps")[
    A set of practices combining software development (Dev) and IT operations (Ops)
    to shorten the development lifecycle and deliver high-quality software continuously.
  ]

  == The DevOps Lifecycle
  #figure(
    image("resources/DevOps_Lifecycle_Phases.png", width: 80%),
    caption: [The DevOps Lifecycle in Phases],
  )

  #stage(
    number: 1,
    name: "Plan",
    category: "Continuous Feedback",
    activities: (
      "Requirements, goals, roadmap & stories creation",
      "Architecture sketch",
      "Security checks plan",
      "Metrics & Alerts analysis",
      "Risk & rollback strategy",
    ),
    tools: ("Jira", "Asana", "GitHub Issues"),
  )

  #stage(
    number: 2,
    name: "Code",
    category: "Continuous Integration",
    activities: (
      "Write & refactor code",
      "Local builds",
      "Local tests",
      "Peer review & gated merges",
    ),
    tools: ("GitLab", "GitHub", "Bitbucket"),
  )

  #stage(
    number: 3,
    name: "Build",
    category: "Continuous Integration",
    activities: (
      "Compile source codes / generate binaries",
      "Create container images",
      "Publish artifacts",
      "Generate versioned release packages",
      "Store build metadata",
    ),
    tools: (
      "GitLab CI/CD, GitHub Actions, Jenkins, Azure Pipelines",
      "Maven, Gradle, Make, Taskfile",
      "Docker, Podman, Buildah",
      "Artifactory, GitLab/GitHub Package",
      "Quay / Google / GitLab / GitHub Image Registry",
    ),
  )

  #stage(
    number: 4,
    name: "Test",
    category: "Continuous Delivery",
    category2: "Continuous Deployment",
    activities: (
      "Execute automated test suites on each commit",
      "Run UI / end-to-end tests against a test environment",
      "Conduct & perform load testing",
      "Carry out security / vulnerability scans on built artefacts",
      "Measure code-coverage and enforce quality gates",
      "Collect and publish test reports, logs, and metrics for traceability",
    ),
    tools: (
      "GitLab CI/CD, GitHub Actions, Jenkins, CircleCI",
      "JUnit / TestNG / pytest / Mocha",
      "Selenium / Cypress / Playwright",
      "JMeter / Gatling / Locust / k6",
      "Snyk / Trivy",
      "Codecov / SonarQube / SonarCloud",
    ),
  )

  #stage(
    number: 5,
    name: "Release",
    category: "Continuous Delivery",
    category2: "Continuous Deployment",
    activities: (
      "Promote the verified artefact to a release repo",
      "Assign an immutable version",
      "Run final pre-deployment sanity checks",
      "Publish release notes and notify stakeholders",
      "Store release metadata (buildID, commit SHA, artefact hash) for traceability",
    ),
    tools: (
      "GitLab CI/CD, GitHub Actions, Azure Pipelines, CircleCI, Jenkins",
      "Artifact repositories: GitLab Package Registry, GitHub Packages, Artifactory",
      "Signing/verification: GnuPG, Cosign, Notary",
    ),
  )

  #stage(
    number: 6,
    name: "Deploy",
    category: "Continuous Deployment",
    activities: (
      "Pull released artefact into the target environment",
      "Apply the deployment manifest",
      "Execute a deployment strategy",
      "Perform post deployment validation",
      "Provide / Trigger rollback if validation fails",
      "Communicate deployment status to the team(if appropriate also to customer)",
      "Archive the deployed version and config for audit purposes",
    ),
    tools: (
      "ArgoCD, Flux, AWS CodeDeploy, Google Cloud Deploy, Azure DevOps Release",
      "Kubernetes, Kustomize, Helm",
      "Terraform / OpenTofu, Pulumi",
      "Ansible, Chef, Puppet",
      "Canary/feature-flag controllers: Flagger, LaunchDarkly, Unleash",
    ),
  )

  #stage(
    number: 7,
    name: "Operate",
    category: "Continuous Feedback",
    activities: (
      "Document, troubleshoot and resolve issues",
      "Scaling resources, applying patches, rotating secrets",
      "Manage configuration drift detection and enforce desired-state",
      "Back up critical data and verify restore procedure regularly",
      "Ensure compliance reporting for regulatory requirements",
    ),
    tools: (
      "ServiceNow, PagerDuty, Opsgenie, VictorOps",
      "HashiCorp Vault, AWS Secrets Manager, Azure Key Vault, 1Password",
      "Velero, Restic, AWS Backup, Azure Backup, BorgBackup, rsnapshot",
      "Kubernetes Horizontal/Vertical Pod Autoscaler, AWS Auto Scaling Groups, Google Cloud Autoscaler, Azure VM Scale Sets",
      "OpenSCAP, Falco, Aqua Security, Prisma Cloud, AWS Config, Azure Policy",
    ),
  )

  #stage(
    number: 8,
    name: "Monitor",
    category: "Continuous Feedback",
    activities: (
      "Define service-level indicator (SLIs), service-level objectives",
      "Build real-time dashboards",
      "Configure and periodically check alerting rules",
      "Run health checks to verify end-to-end functionality",
      "Correlate logs, metrics, and traces",
    ),
    tools: (
      "Prometheus, InfluxDB, Graphite, Datadog Metrics, NewRelic Metrics",
      "Grafana, Kibana, Datadog Dashboard, New Relic One",
      "Jaeger, Zipkin, Lightstep, Dynatrace",
      "ElasticStack (ELK/EFK), Loki+ Grafana, Splunk, Graylog",
      "Pingdom, UptimeRobot, Grafana Synthetic Monitoring, NewRelic Synthetics",
      "PrometheusAlertmanager, Grafana Alerting",
    ),
  )

  - *Dev side*: Plan → Code → Build → Test
  - *Ops side*: Deploy → Operate → Monitor
  - *Release* is the bridge connecting both halves
  #pagebreak()

  == Continuous Lifecycle

  #def("Continuous Integration (CI)")[
    Practice of frequently merging code changes into a shared repository, with
    automated build and test on every change.\
    Entails:
    - *Continuous Development* = Plan + Code
    - *Continuous Integration* (narrower) = Code + Build
    - *Continuous Testing* = Test
  ]

  #def("Continuous Deployment / Delivery (CD)")[
    Automatically deploying every change that passes CI to staging/production.\
    Entails:
    - *Continuous Delivery* = Test + Release
      - code is automatically validated and packaged
    - *Continuous Deployment*: Test + Release + Deploy
      - goes one step further and automatically deploys every validated change to production


    #strategy-list(
      title: "Continuous Deployment Strategies",
      (
        ("Rolling deployment", "Update gradually to minimize downtime"),
        ("Blue-green", "Two different environments for fast switching"),
        ("Canary release", "Specify a user group to deploy to first"),
        ("Feature flags", "Deploy but activate later"),
        ("Dark launching", "Use real user traffic but hide it from them"),
      ),
    )
  ]

  #def("Continuous Feedback")[
    Practice of feeding insights from the Operate and Monitor stages (incidents, metrics, usage data) back into Planning, closing the DevOps loop so each cycle informs the next\
    Operate → Monitor → Plan
  ]

  == Platform Engineering

  #def("Platform Engineering")[
    A cultural mindset focused on designing, building, and operating internal developer platforms (IDPs) - essentially treating infrastructure/tooling as a product for internal developers to use.
  ]

  #strategy-list(
    title: "Core Responsibilities",
    (
      ("Enable self-service", "Let developers provision what they need without filing tickets to Ops"),
      ("Standardize runtimes & tooling", "Consistent stacks across teams"),
      ("Abstract infrastructure", "Hide underlying complexity (clouds, clusters, networking) behind simple interfaces"),
      ("Enforce compliance & security", "Bake policy/guardrails into the platform itself"),
      ("Provide observability", "Built-in monitoring/logging by default"),
    ),
  )

  *Typical Building Blocks* (bottom-up stack)*:*
  + Compute & Orchestration
  + Infrastructure as Code
  + CI/CD Pipelines & Deployment
  + Package & Artifact Management
  + Policy & Security
  + Observability
  + Cost & Capacity
  + Self-Service Portal (IDP)

  == Key Takeaways

  #takeaways((
    [*DevOps:* Combines software development and IT operations with the goal of continuous delivery of software],
    [*The DevOps cycle has 8 stages:* Plan, Code, Build, Test, Release, Deploy, Operate, Monitor - forming a continuous infinity loop between Dev and Ops],
    [*CI/CD terminology maps onto the same cycle:* Continuous Integration, Delivery Deployment, and Feedback are just different groupings of those 8 stages],
    [*Feedback closes the loop:* Operate and Monitor data flows back into Plan, making the cycle continuous],
    [*Platform Engineering builds on DevOps:* It packages DevOps stages into a sel-service internal platform so developers don't reinvent CI/CD, IaC, and observability themselves],
    [*Internal platforms should be treated as products* - built for developer "customers", not run as a ticket-based service desk.],
  ))
]

// ===========================================================================
// Lecture 2 — CI/CD with GitLab
// ===========================================================================
#lecture(
  title: "CI/CD with GitLab",
  learning-objectives: (
    "Explain CI/CD",
    "Model a CI/CD pipeline and map it to the DevOps cycle",
    "Write a functional .gitlab-ci.yml file",
    "Understand the different testing strategies",
  ),
)[
  #def("CI/CD pipeline")[
    A series of automated steps that helps software teams deliver code faster, safer and more reliably. CI/CD Pipelines are an essential part of continuous integration and deployment and are critical for modern software development.
  ]

  === Benefits
  - Faster feedback loops lead to higher quality
  - Reduce manual effort and therefore also human errors
  - Lead to consistent environments, "works on my machine" disappears
  - Parallel jobs allow for scalability in order to process many commits without extra manual effort
  - Logged pipeline outputs provide traceability for audits
  - Increase efficiency and save costs
  - *Enables continuous delivery and deployment*

  == Concepts
  #compare-table(
    ([Concept], [Purpose]),
    ([Stages], [Logical grouping of jobs]),
    ([Jobs], [Atomic units of work that run inside a stage]),
    ([Steps], [Individual commands/scripts that a job executes]),
    ([Rules], [Controls when a job runs]),
    ([Services], [Auxiliary containers/services that run alongside a job (databases, Docker-in-Docker, APIs)]),
    ([Runners], [Compute resources that execute jobs (also agents or executers)]),
    ([Caches], [Temporary storage that speeds up repeated work (dependency downloads, compiled objects)]),
    ([Artifacts], [Files produced by a job that are persisted for later stages or for download]),
    ([Registries], [Stores for built images or packages (Docker Hub, GitLab Container Registry)]),
    (
      [Variables],
      [Secrets are key-value pairs (plain or masked) injected into jobs for configuration or credentials],
    ),
  )

  #pagebreak()

  == GitLab CI Pipeline Basics
  === Typical Stages
  #stage(
    number: 0,
    name: "Git commit triggers the pipeline",
  )

  #stage(
    number: 1,
    name: "Build",
    activities: (
      "Compile code",
      "Create container images",
      "Run unit, integration, security and performance tests",
    ),
  )

  #stage(
    number: 2,
    name: "Test",
    activities: (
      "Run unit, integration, security and performance tests",
    ),
  )

  #stage(
    number: 3,
    name: "Release",
    activities: (
      "Publish artifacts to a registry",
    ),
  )

  #stage(
    number: 4,
    name: "Deploy",
    activities: (
      "Push the artifact to a target environment (staging, production",
    ),
  )

  #stage(
    number: 5,
    name: "Post-Deploy (optional)",
    activities: (
      "Smoke tests, health checks, notifications, roll-back on failures",
    ),
  )

  #pagebreak()

  #compare-table(
    ([Concept], [GitLab keyword], [Example]),
    ([Stages], [```bash stages ```], [```bash stages: [build, test, deploy]```]),
    ([Jobs], [top-level key], [```bash job_name: { stage:, script: [...] }```]),
    ([Steps], [```bash script ```], [```bash script: ["cmd1", "cmd2"] ```]),
    ([Rules], [```bash rules ```/```bash  only ```/```bash  except ```], [```bash rules: [{if: ..., when: ...}] ```]),
    ([Services], [```bash services ```], [```bash services: [{name: "postgres:15", alias: "db"}] ```]),
  )

  #def("Environments")[
    Describe where code is deployed (Review / Staging / Production / etc.), They can link to a Kubernetes cluster and are declared in the gitlab-ci.yml or the GitLab UI.

    #cmd(```bash
    setup-review:
    stage: deploy
    image: alpine/curl:latest
    script:
      - echo "setup review environment for MR ${CI_MERGE_REQUEST_IID}"
    environment:
      name: review/$CI_COMMIT_REF_SLUG
      url: https://${DEV_DOMAIN_NAME}
      on_stop: stop_review
    rules:
      - if: $CI_MERGE_REQUEST_ID
        when: manual```)

    - ```bash environment.name ``` — dynamically named per merge request using ```bash $CI_COMMIT_REF_SLUG```, so each MR gets its own review environment
    - ```bash environment.url ``` — the link GitLab shows in the MR/pipeline UI to jump straight to that environment
    - ```bash environment.on_stop ``` — references another job (stop_review) that tears down the environment when it's no longer needed
    - ```bash rules ``` — this job only runs (manually) when triggered from a merge request
  ]

  #def(
    "Runners",
  )[A worker that executes pipeline jobs that can be run in:
    - Local shell
    - Via SSH
    - Virtualized wit Parallels/Virtualbox
    - Docker (Autoscaler)
    - Kubernetes

    A dedicated runner is set up by installing ```bash gitlab-runner``` and registering it to the project via a registration token.

    #compare-table(
      ([Type], [Scope], [Registered/managed by]),
      ([Instance runner], [Available to all projects/groups on the GitLab instance], [GitLab admin]),
      (
        [Group runner],
        [Available to all projects within a specific group (and its subgroups)],
        [Group owner/maintainer],
      ),
      (
        [Project runner],
        [Dedicated to one specific project (can be shared with select other projects)],
        [Project maintainer],
      ),
    )

    A runner is picked by a job via ```bash tags``` advertised by each runner, regardless of whether that runner is instance-, group-, or project-scoped.
  ]



  #takeaways((
    [Pipeline = stages → jobs → scripts, triggered by git events (push, merge request, tag)],
    [Typical stages: Build → Test → Release → Deploy → Post-Deploy (optional)],
    [Runners execute the jobs: Can be dedicated to a group/project or instance runners, available to the entire GitLab instance],
    [Environments track where code is deployed],
  ))

]

// ===========================================================================
// Lecture 3 — Infrastructure Provisioning (Infrastructure as Code)
// ===========================================================================
#lecture(
  title: "Infrastructure Provisioning (IaC)",
  learning-objectives: (
    "Explain the motivation behind Infrastructure-as-Code (IaC) and its benefits",
    "Understand and differentiate between imperative and declarative approaches",
    "Identify the core components of a typical IaC toolchain (language, state, provisioner, backend)",
    "Write a small IaC script that provisions some simple resources in the public cloud.",
    "Troubleshoot IaC issues",
  ),
)[

  #def("Infrastructure as Code (IaC)")[
    Managing and provisioning infrastructure through machine-readable definition
    files, rather than manual configuration.
  ]

  #takeaways((
    [...],
  ))
]

// ===========================================================================
// Lecture 4 — Configuration Management
// ===========================================================================
#lecture(
  title: "Configuration Management",
  learning-objectives: (
    "Explain the difference between infrastructure provisioning and configuration management (CM)",
    "Understand the motivation and benefits of configuration management",
    "Differentiate between imperative and declarative approaches in CM",
    "Write basic Ansible playbook for server configuration",
    "Troubleshoot common Ansible issues",
  ),
)[

  #compare-table(
    ([Tool], [Type], [Language]),
    ([Ansible], [Agentless, push-based], [YAML]),
    ([...], [...], [...]),
  )

  #takeaways((
    [...],
  ))
]

// ===========================================================================
// Lecture 5 — Kubernetes Object Management
// ===========================================================================
#lecture(
  title: "Kubernetes Object Management",
  learning-objectives: (
    "Explain what problems Kubernetes helps solving and how",
    "Understand and explain the purpose of different Kubernetes objects, such as pods, services, deployments, config maps, and secrets",
    "Understand the difference between imperative commands and declarative configuration for managing objects in Kubernetes and the different usage of the kubectl command",
    "Understand how to view the history of changes to objects, rollback to previous versions if necessary, and ensure reliable management of object configurations over time",
  ),
)[

  #cmd[
    ```bash
    kubectl apply -f deployment.yaml
    kubectl get pods -n namespace
    ```
  ]

  #takeaways((
    [...],
  ))
]

// ===========================================================================
// Lecture 6 — Kubernetes Resource Packaging (Helm)
// ===========================================================================
#lecture(
  title: "Kubernetes Resource Packaging",
  learning-objectives: (
    "Differentiate between Helm (package manager) and Kustomize (configuration overlay tool)",
    "Explain the concept of \"Chart\" and \"Release\" in Helm",
    "Understand the \"Base and Overlay\" pattern in Kustomize",
    "Demonstrate how to package an application for multiple environments",
    "Critique the trade-offs between Helm and Kustomize",
  ),
)[

  #cmd[
    ```bash
    helm create mychart
    helm install myrelease ./mychart
    ```
  ]

  #takeaways((
    [...],
  ))
]

// ===========================================================================
// Lecture 7 — Kubernetes Security (Guest Lecture: Cilium / Isovalent)
// ===========================================================================
#lecture(
  title: "Kubernetes Security — Cilium Networking and Policies",
  learning-objectives: (
    "eBPF Basics",
    "Cilium Networking",
    "Cilium Network Policy Deep Dive",
    "Getting Started with Cilium Network Policies",
  ),
)[
  // Note: this guest-lecture deck has no dedicated "Learning Objectives" slide.
  // The items above are taken verbatim from its "Content" outline slide instead.

  #def("eBPF")[
    A technology that runs sandboxed programs in the Linux kernel without
    changing kernel source code, used by Cilium for networking/security.
  ]

  #takeaways((
    [...],
  ))
]

// ===========================================================================
// Lecture 8 — Service Mesh
// ===========================================================================
#lecture(
  title: "Service Mesh",
  learning-objectives: (
    "No dedicated \"Learning Objectives\" slide found in this deck — fill in manually if your slide deck version differs.",
  ),
)[

  #def("Service Mesh")[
    Dedicated infrastructure layer for handling service-to-service communication,
    typically via sidecar proxies.
  ]

  #takeaways((
    [...],
  ))
]

// ===========================================================================
// Lecture 9 — Observability
// ===========================================================================
#lecture(
  title: "Kubernetes Observability",
  learning-objectives: (
    "No dedicated \"Learning Objectives\" slide found in this deck — fill in manually if your slide deck version differs.",
  ),
)[

  #compare-table(
    ([Pillar], [Purpose], [Example Tool]),
    ([Metrics], [Quantitative system state], [Prometheus]),
    ([Logs], [Discrete event records], [Loki]),
    ([Traces], [Request flow across services], [Jaeger]),
  )

  #takeaways((
    [...],
  ))
]

// ===========================================================================
// Lecture 10 — GitOps & Site Reliability Engineering
// ===========================================================================
#lecture(
  title: "GitOps & Site Reliability Engineering",
  learning-objectives: (
    "Define GitOps and explain its core principles (Declarativity, Version Control, Automated Delivery, Continuous Reconciliation).",
    "Contrast GitOps with traditional CI/CD push-based models.",
    "Compare the two leading implementations: Argo CD and Flux CD.",
    "Evaluate trade-offs to select the right tool for a specific scenario.",
  ),
)[

  #def("GitOps")[
    Operating model where Git is the single source of truth for declarative
    infrastructure and applications, with automated reconciliation.
  ]

  #important[
    Know the difference between push-based and pull-based GitOps deployment models.
  ]

  #takeaways((
    [...],
  ))
]
