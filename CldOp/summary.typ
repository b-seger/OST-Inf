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

  The DevOps Lifecycle consists of the following stages:
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
      "Write & refactor code",
      "Local builds",
      "Local tests",
      "Peer review & gated merges",
    ),
    tools: ("GitLab", "GitHub", "Bitbucket"),
  )

  #stage(
    number: 8,
    name: "Monitor",
    category: "Continuous Feedback",
    activities: (
      "Write & refactor code",
      "Local builds",
      "Local tests",
      "Peer review & gated merges",
    ),
    tools: ("GitLab", "GitHub", "Bitbucket"),
  )

  == CI/CD

  #def("Continuous Integration (CI)")[
    Practice of frequently merging code changes into a shared repository, with
    automated build and test on every change.
  ]

  #def("Continuous Deployment / Delivery (CD)")[
    Automatically deploying every change that passes CI to staging/production.
  ]

  == Key Takeaways

  #takeaways((
    [...],
    [...],
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

  == GitLab CI Pipeline Basics

  #cmd[
    ```yaml
    stages:
      - build
      - test
      - deploy
    ```
  ]

  #note[Add the `.gitlab-ci.yml` structure, stages, jobs, runners here.]

  #takeaways((
    [...],
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
