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

  === Benefits
  - Enables Automation
  - Drift detection
  - Repeatability/idempotency - same code produces the same result
  - Source of truth via state file
  - Team collaboration via remote backends + locking

  == Imperative vs. Declarative
  #compare-table(
    ([], [Imperative (procedural)], [Declarative (desired-state)]),
    ([*Focus*], [How to achieve a result], [What the result should look like]),
    ([*Control flow*], [Explicit], [Implicit]),
    ([*State/idempotency*], [Usually stateless, not idempotent], [Usually stateful and idempotent]),
  )

  == Terraform/OpenTofu

  #def("Terraform")[
    A Open-Source infrastructure as code engine written in GO, created and owned by HashiCorp. It uses the HashiCorp Configuration Language (HCL).
  ]

  #def("OpenTofu")[
    A Fork of Terraform v1.5.7, under the Linux Foundations stewardship. It is a Drop-in replacement and has feature parity with Terraform. It includes additional features like local state encryption.
  ]

  #pagebreak()

  === HCL & File Conventions

  #def("HCL")[
    Human-readable language used to write Terraform files.

    - *Declarative*: you describe the final state you want, not the steps to get there
    - *Blocks & Arguments*: structure uses ```bash { }``` for blocks, ```bash key = "value"``` for settings
    - *Logic-Lite*: Supports simple loops, conditionals, and functions (e.g. ```bash count``` or ```bash for_each```)
    - *Machine-Friendly*: optimized for both human editing and automated API processing
    - *File handling*: files end in ```bash .tf```, and Terraform loads every ```bash .tf``` file in the working directory
  ]

  The terraform block is a mandatory bootstrapping block, it tells Terraform which version it needs and which providers (and versions) to fetch during init:
  #cmd(
    ```bash
    terraform {
      required_version = ">= 1.0.0"
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 3.68.0"
        }
      }
    }
    ```,
  )

  === File Naming Best Practices
  #compare-table(
    ([Filename], [Purpose]),
    ([terraform.tf], [required_version + required_providers]),
    ([backend.tf], [remote state config (kept separate from versioning)]),
    ([providers.tf], [auth/config for your specific providers]),
    ([main.tf], [primary workspace — resource and data source blocks]),
    ([variables.tf], [input definitions (kept in alphabetical order)]),
    ([outputs.tf], [return values for other modules/CLI (alphabetical order)]),
    ([locals.tf], [derived/computed local values]),
    ([override.tf], [special-use overrides — loaded last; use sparingly, with comments]),
  )

  === Terraform Core Concepts
  #def("Providers")[
    - *API bridges* that translate Terraform/HCL into specific cloud API calls
    - Define the *resource mapping*: which "building blocks" (VMs, databases, networks) are available
    - *Multi-Platform*: Connects to AWS, Azure, Google Cloud, SaaS tools, or even local hardware
    - *State-aware*: checks if real world infrastructure matches code
    - Handle *authentication/credentials* to the backend service
    - *You cannot use Terraform without one, every* ```bash .tf``` *config needs at leas one provider block*

    #cmd[
      ```bash
        provider "aws" {
        access_key = var.aws_access_key
        secret_key = var.aws_secret_key
        region     = "us-east-1"
        }
      ```
    ]
  ]

  #def("Resources")[
    - Specific infrastructure objects (VMs, DBs, Networks)
    - Declares what you want to create or manage
    - *Goal*: Represents the desired final state of a component
    - *Example* - Create an EC2 instance in AWS:
    #cmd[
      ```bash
        resource "aws_instance" "web" {
          ami           = "ami-0123456789abcdef0"
          instance_type = "t3.micro"

          tags = {
            Name = "web-server"
          }
        }
      ```
    ]
  ]

  #def("Data")[
    - Fetches information from existing infrastructure
    - *External Reference*: uses data not managed by the current code
    - Data Lookup:
      #cmd[
        ```bash
        data "aws_ami" "ubuntu" {
          most_recent = true

          filter {
            name   = "name"
            values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
          }

          filter {
            name   = "virtualization-type"
            values = ["hvm"]
          }

          owners = ["099720109477"]  # Canonical
        }
        ```
      ]

    - Data Usage:
      #cmd[
        ```bash
        # ── Look up an AMI by criteria ──
        data "aws_ami" "ubuntu" {
          # ...
        }

        # ── Defining resources ──
        resource "aws_instance" "example" {
          ami           = data.aws_ami.ubuntu.id   # <- pulled straight from the data source
          instance_type = "t2.micro"
          # ...
        }

        # ── Output useful ids ──
        output "ami_id" {
          value       = data.aws_ami.ubuntu.id
          description = "The image ID we interrogated for Ubuntu AMI"
        }
        ```
      ]

  ]

  #def("Variables")[
    - Dynamic values provided at runtime
    - Makes configurations flexible without changing code
    - Keeps secrets and environment-specific data separate

    #cmd[
      ```bash
      variable "aws_access_key" {
        type        = string
        description = "AWS access key, supply via TF_VAR_aws_access_key"
        sensitive   = true
        # no default -> Terraform prompts interactively if not set
      }

      variable "instance_type" {
        type    = string
        default = "t3.micro"
      }

      # Override variable at runtime:
      # terraform apply -var="port=8081"

      # Provided as environment variable in the shell:
      # export TF_VAR_aws_access_key="AKIA..."
      # export TF_VAR_aws_secret_key="..."
      ```
    ]
  ]

  #def("Outputs")[
    - Data displayed after a successful ```bash apply```
    - *Information sharing*: passes values (like an IP address) to the user or to other modules
    - *Visibility*: surfaces critical resource attributes directly in the CLI output
    #cmd[
      ```bash
      output "instance_public_ip" {
        value       = aws_instance.web.public_ip
        description = "Public IP of the web server"
      }
      ```
    ]
  ]

  #def("References")[
    - Connects blocks of code together
    - *Dependency mapping*: tells Terraform what to build first
    - Implicit by default, but can be forced explicit with ```bash depends_on```
    - *Attribute access*: pulls a value (like an IP) from one resource into another
    - *Consistency*: if a source value changes, everything referencing it updates automatically

    #cmd[
      ```bash
      resource "aws_eip" "web_ip" {
        instance = aws_instance.web.id   # implicit reference -> implicit dependency

        depends_on = [aws_instance.web]  # explicit dependency (rarely needed; usually automatic)
      }
      ```
    ]

  ]

  #def("Modules")[
    - Containers for grouping multiple resources together
    - A reusable, parameterized bundle of Terraform config
    - Allows for standardization, enforcing best practices across an organization

    #cmd[
      ```bash
      module "web_server" {
        source        = "./modules/ec2-instance"
        instance_type = var.instance_type
        ami           = "ami-0123456789abcdef0"
      }
      ```
    ]
  ]


  === The State File

  #def("State")[
    *The Source of Truth*
    - A JSON file mapping your code to real-world resource IDs
    - Default stored in ```bash terraform.tfstate```
    - It has two Jobs:
      - *Performance* - lets Terraform "remember" what it built previously, so it doesn't have to rediscover everything from scratch
      - *Drift detection* - catches when someone manually changed a setting in the console
  ]

  The First time you run ```bash terraform apply```, terraform notices there is no state file, it updates the cloud (creates the resources) and creates the ```bash .tfstate file as a byproduct```
  - Flow: ```bash HCL → plan → apply → cloud → update .tfstate```

  #pagebreak()
  Every subsequent apply is a 3-way comparison:

  #figure(
    image("resources/terraform_state_3way_diff.svg", width: 80%),
    caption: [Terraform 3-way Diff],
  )

  + NEW — Terraform reads your current script
  + EXISTING — Terraform reaches out to the cloud (```bash refresh```) to see what's actually provisioned right now
  + PREVIOUS — Terraform reads the ```bash .tfstate``` file from the last run
  Terraform reconciles all three to build a full picture of the situation, then decides what action to take (create/update/destroy/no-op per resource)

  #pagebreak()

  *Example State File*:
  - The terraform resource is the existing desired state in the script
  - The arn is used to check the cloud and see if anything has changed
  #cmd(
    ```bash
    {
      "version": 4,
      "terraform_version": "0.15.1",
      "serial": 4,
      "lineage": "672708eb-8c19-0463-9eb0-81e20b008a9d",
      "outputs": {},
      "resources": [
        {
          "mode": "managed",
          "type": "aws_instance",
          "name": "exercise_0020",
          "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
          "instances": [
            {
              "schema_version": 1,
              "attributes": {
                "ami": "ami-...",
                "arn": "arn:aws:ec2:us-east-1:641995674308:instance/i-0f5f630af308f2516",
                # truncated for brevity
                "vpc_security_group_ids": [
                  "sg-02447ae77b0fda694",
                  "sg-02a4ff78bfae29ce2"
                ]
              },
              "dependencies": [
                "aws_security_group.sec_http",
                "aws_security_group.sec_ssh"
              ]
            }
          ]
        }
      ]
    }
    ```,
  )


  === Backends: Team Collaboration

  By default, the state file is local. This works fine in a solo environment, to work in teams, the state file should be shared. Terraform supports storing the state in a third party, for example in Amazon S3.

  *Sequence per* ```bash apply```:
  + Acquire lock
  + Fetch ```bash terraform.tfstate``` from S3
  + Update the cloud with the desired changes
  + Send the updated ```bash terraform.tfstate``` back to S3

  *Locking rule*: if two users run ```bash apply``` simultaneously, whoever grabs the lock first wins

  #pagebreak()
  *Using the Bucket*:

  Like a forwarding address you put at the top of your project, telling Terraform: "don't keep your memory (state) on this laptop — keep it over there instead."
  #cmd(
    ```bash
    terraform {
      backend "s3" {
        bucket       = "bucket-name"
        key          = "backend/terraform.tfstate"
        region       = "us-east-1"
        use_lockfile = true
      }
    }
    ```,
  )


  *Creating the bucket*:

  An ordinary resource block — "create an S3 bucket," then "turn on versioning for that bucket".
  #cmd(
    ```bash
    resource "aws_s3_bucket" "backend" {
      bucket = "bucket-name"
    }

    resource "aws_s3_bucket_versioning" "backend" {
      bucket = aws_s3_bucket.backend.id
      versioning_configuration {
        status = "Enabled"
      }
    }
    ```,
  )

  #important[Locking via ```bash dynamodb_table = "tfstate_lock"``` is deprecated]

  *Best practices*:
  - One folder per environment (dev/, prod/, base/, modules/)
  - Each folder gets its own state file — never mix state across environments
    - Blast radius containment


  === Terraform Workflow & Provisioners

  #def("Provisioners")[
    Plugins that run scripts on a resource after it's been created, for post-creation setup. As opposed to providers, which create the resource in the first place.

    Common types: remote-exec (runs commands on the remote resource), local-exec (runs commands on the machine running Terraform).
  ]

  #figure(
    image("resources/terraform-workflow.svg", width: 80%),
    caption: [Terraform 3-way Diff],
  )

  #takeaways((
    [IaC replaces manual provisioning with code],
    [Terraform is declarative, not imperative],
    [The toolchain has four named components — language, state, provisioner, backend],
    [Providers are the bridge to the real world],
    [Resources declare what you want; data sources read what already exists],
    [State is the mechanism that makes drift detection possible],
    [Backends solve the team-collaboration problem state creates],
    [Modules exist for reusability and standardization],
    [Workflow: Write HCL → init → plan → apply → destroy -  with plan being read-only (preview) and apply being the only step that actually changes anything ],
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

  #def("Configuration Management ")[
    - Comes after infrastructure provisioning in the workflow
    - Centrally modifies base configurations
    - Rolls out new settings to all applicable systems
    - Automates system identification, patching, and updates
    - Identifies outdated, poorly performing, and noncompliant configurations
    - Example scope: server configuration of packages / users / services
  ]

  == What is Ansible?

  #def("Ansible")[
    An IT Automation tool that:
    - Configures systems
    - Deploys software
    - Orchestrates more advanced IT tasks
      - continuous deployments
      - zero downtime rolling updates

    *Use cases*: Configuration Management, Security & Compliance
  ]

  === Terraform vs. Ansible
  #compare-table(
    ([], [Imperative (procedural)], [Declarative (desired-state)]),
    ([*Primary role*], [Provisioning], [Configuration Management]),
    ([*Paradigm*], [Declarative], [Hybrid]),
    ([*Lifecycle*], [Has state/lifecycle], [No Lifecycle]),
    ([*Idempotency*], [Idempotent], [Idempotency optional]),
  )

  #pagebreak()

  == Ansible Architecture & Connection Model
  - *Control node*: where Ansible runs (the "management node")
  - *Managed nodes*: target hosts
  - Connections happen via
    - *localhost* (local connection)
    - *SSH* (Linux/Unix hosts)
    - *WinRM* (Windows hosts)
  - No agent required on managed nodes (agentless)

  === Inventory
  - File listing hosts and variables Ansible will operate on
  - Two supported formats: *INI* or *YAML*
  Example YAML:
  #cmd(
    ```bash
        --
    all:
      hosts:
        r1:
          ansible_host: 192.168.1.10
        r2:
          ansible_host: 192.168.1.11
        sw1:
          ansible_host: 192.168.1.20
        sw2:
          ansible_host: 192.168.1.21
      children:
        router:
          r1:
          r2:
        switches:
          sw1:
          sw2:
      vars:
        ansible_user: cisco
        ansible_ssh_pass: cisco
    ```,
  )

  Example INI:
  #cmd(
    ```bash
    [router]
    r1 ansible_host=192.168.1.10
    [switches]
    sw1 ansible_host=192.168.1.20
    [all:vars]
    ansible_user=cisco
    ```,
  )

  *Ad-hoc commands* (one-off, non-playbook execution):
  #cmd(
    ```bash
    $ ansible [pattern] -m [module] -a "[module options]"
    $ ansible webservers -m ansible.builtin.file -a "dest=/srv/foo/a.txt mode=600"
    ```,
  )
  - Default module (if -m omitted) is command
  - Can target multiple groups: ```bash ansible nodes:webservers -a "shutdown -h now" --become```

  #pagebreak()

  == Plays & Playbooks
  - *Task*: individual unit of work (e.g. install a package, copy a file)
  - *Play*: one or more tasks run in order, defines which hosts to run on. Hosts that fail a task are removed from the rest of the play.
  - *Playbook*: a single YAML file containing one or more plays

  #cmd(
    ```bash
    - name: Configure Web Server
      hosts: web_servers
      tasks:
        - name: Install Nginx
          apt:
            name: nginx
            state: present
        - name: Copy website files
          copy:
            src: /local/path/
            dest: /var/www/html/
    ```,
  )
  == Core Constructs

  #def("Facts")[
    - Automatically collected info about hosts when a playbook runs ("Gathering Facts," via the ```bash setup``` module)
    - Stored in ```bash ansible_facts``` variable
    - Can be disabled with ```bash gather_facts```: no for performance/when not needed
  ]

  #def("Conditionals")[
    - ```bash when:``` clause uses raw Jinja2 expressions
    - Can branch on facts, registered variables, or regular variables
    - Example pattern: register a command's exit code, then gate a later task on it:

    #cmd(
      ```bash
      - name: Check if already present
        command: which docker
        failed_when: false
        changed_when: false
        register: docker_available

      - name: Download install script
        get_url:
          url: https://get.docker.com/
          dest: /tmp/get-docker.sh
        when: docker_available.rc == 1
      ```,
    )
  ]

  #def("Loops")[
    - Useful for creating multiple users, installing multiple packages, or repeating a polling step
    - Example:
    #cmd(
      ```bash
      - name: add several users
        user:
          name: "{{ item.name }}"
          groups: "{{ item.groups }}"
        loop:
          - { name: 'testuser1', groups: 'wheel' }
          - { name: 'testuser2', groups: 'root' }
      ```,
    )

    #important("Some Plugins can take lists as options - better than looping")
  ]

  #def("Handlers")[
    - A task triggered by another task — but only if the triggering task reported a change AND all other tasks succeeded
      - Not run if the triggering task results in "OK" (no change)
    - Run after all other tasks complete successfully; skipped entirely if an earlier task fails
    - Related flags: ```bash ignore_errors``` (continue play despite error), ```bash force_handlers``` (run handlers even if some tasks failed)
  ]

  #def("Ansible Vault (secrets)")[
    - Encrypts sensitive data (passwords, keys) so they aren't stored in plaintext in playbooks/roles
    - Vault files can safely be committed to source control
    - CLI commands: ```bash ansible-vault create```, ```bash edit```, ```bash view```, ```bash encrypt_string```
    - Password supply methods: file, interactive prompt (```bash @prompt```), or a secret-manager script (```bash vault-keyring-client.py```)
    - Usage pattern: reference ```bash vars_files: [vault.yml]``` in the playbook, consume encrypted vars via Jinja2 (```bash {{ username }}```)
  ]

  == Templating (Jinja2)
  - Ansible uses Jinja2 for dynamic expressions/variables
  - *Templating happens on the controller*, not the managed node — only the resolved result is sent to the target

  *Mechanism*: the ```bash template:``` module takes a ```bash .j2``` source file (```bash src:```) and writes the rendered output to a destination path (```bash dest:```) on the target.

  *Example*:

  ```bash playbook.yml```:
  #cmd(
    ```bash
    - hosts: localhost
      vars:
        cars: [Porsche, Tesla, Ferrari, Dacia, Citroen, Volvo, Saab]
      tasks:
        - name: template looping example
          template:
            src: template.j2
            dest: thecars.txt
    ```,
  )

  ```bash template.j2```:
  #cmd(
    ```bash
    My Template Cars are
    {% for item in cars %}
    {{ item }}
    {% endfor %}
    ```,
  )

  Rendered ```bash thecars.txt```:
  #cmd(
    ```
    My Template Cars are
    Porsche
    Tesla
    Ferrari
    Dacia
    Citroen
    Volvo
    Saab
    ```,
  )

  === Filters
  - Filters transform data inside a template expression — syntax is {{ value | filter }}

  #cmd(
    ```
    {{ list | min }}                  {# minimum value from a list #}
    {{ [3, 4, 2] | max }}             {# maximum value from a list #}
    {{ ['a', 'b', 'c'] | shuffle }}   {# => ['b', 'c', 'a'] randomize list order #}
    {{ ipvar | ipaddr }}              {# test if string is a valid IP #}
    {{ ipvar | ipv4 }}
    {{ ipvar | ipv6 }}                {# test IP protocol version #}
    {{ 'test1' | hash('sha1') }}      {# get sha1 hash of a string #}
    ```,
  )

  == Tags
  - Attribute settable on plays, roles, or tasks
  - Lets you run a subset of a playbook instead of the whole thing
  - Tags on a play/static import are inherited by included tasks
  - Two special reserved tags:
    - ```bash always``` — runs unless explicitly skipped with ```bash --skip-tags=always```
    - ```bash never``` — does NOT run unless explicitly requested with ```bash --tags=never```

  Useful CLI: ansible-playbook playbook.yml --list-tasks (shows which tags apply to which tasks)

  #cmd(
    ```bash
    # playbook.yml
    ---
    - hosts: local
      tags:
        -docker
      tasks:
        -name: Install docker
    ```,
  )

  #cmd(
    ```bash
    $ ansible-playbook playbook.yml--list-tasks
    playbook: playbook.yml

      play #1 (local): local        TAGS: [docker]
        tasks:
          Install docker    TAGS: [docker]
    ```,
  )

  == Collections & Roles
  #def("Collections")[
    - Modules are being packaged into Collections (e.g. ```bash cisco.ios.ios_banner``` instead of bare ```bash ios_banner```)
    - Installed via ```bash ansible-galaxy collection install <name>```
    - Found on Ansible Galaxy (public, free) or Automation Hub (RedHat-account-gated, certified collections)
    - Dependencies declared in a ```bash requirements.yml```, listing both collections and roles, installed in one go
  ]

  #def("Roles")[
    - A level of abstraction above tasks/playbooks → reusability
    - Breaks a complex playbook into smaller, self-contained chunks
    - Created via ```bash ansible-galaxy init <name>```, which scaffolds a standard directory structure:

    #cmd(
      ```bash
      cldop/
        ├── defaults/main.yml
        ├── files/
        ├── handlers/main.yml
        ├── meta/main.yml
        ├── tasks/main.yml
        ├── templates/
        ├── tests/
        └── vars/main.yml
      ```,
    )

    - Used in a playbook via the roles: key instead of tasks:
  ]

  == Best Practices
  + Use roles to group related tasks
  + Use Ansible Galaxy — don't reinvent the wheel; reuse and share roles
  + Don't use ```bash ignore_errors``` — it swallows all errors indiscriminately and can leave hosts in a broken/unstable state; use Ansible's built-in error-handling constructs instead (e.g. ```bash failed_when```, ```bash register``` + ```bash when```)
  + Use Vault for secrets/sensitive data
  + Use git — centralize and version playbooks for the whole team; even secrets can go in git if Vault-protected
  + Be pragmatic, not clever — reduce complexity, keep it simple:
    - Avoid regex where possible
    - If missing facts, consider adding custom ones
    - Use templates
    - Use tags
    - Use includes/imports rather than one giant 1000-line playbook
  #pagebreak()

  #takeaways((
    [Configuration management happens after infrastructure provisioning],
    [Ansible is agentless],
    [Templating (Jinja2) runs on the controller, not the target],
    [Handlers only fire on change — they're not run if a task reports "OK"],
    [Roles and Collections exist for reusability — don't write everything from scratch],
    [Secrets belong in Vault, not plaintext — encrypted Vault files can safely live in git],
    [```bash ignore_errors``` is a trap, not a fix — it suppresses all failures indiscriminately and risks leaving hosts in a broken state],
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
