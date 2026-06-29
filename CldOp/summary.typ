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
  == Foundations
  #def("Kubernetes")[
    Kubernetes, also known as K8s, is an open source system for automating deployment, scaling,
    and management of containerized applications.
  ]

  #figure(
    image("resources/Kubernetes_Architecture.png", width: 80%),
    caption: [Kubernetes Architecture Overview],
  )

  #def("Objects")[
    Persistent entities representing a "record of intent", the desired state of the cluster. Defined declaratively, typically via .yaml manifests.
  ]

  #def("Controllers")[
    Track a resource type, compare desired vs. current state, and drive the cluster toward the desired state.
  ]

  #pagebreak()

  == Workloads
  #compare-table(
    ([Object], [Role]),
    ([Pod], [Smallest deployable unit; runs one or more tightly-coupled containers sharing network/storage]),
    ([Init container], [Runs to completion before the main container starts; blocks main container if it fails]),
    (
      [Sidecar container],
      [Runs concurrently with the main container, independent lifecycle, shares network/storage namespace, supports probe],
    ),
    (
      [ReplicaSet],
      [Ensures a specified number of pod replicas are running, matched via label selectors
        #cmd(```bash kubectl scale --replicas=5 rs/app-xy-pod", "Manually scale a ReplicaSet ```)
      ],
    ),
    (
      [Deployment],
      [Higher-level object managing ReplicaSets; provides declarative updates, scaling, and update strategies.

        Recommended over raw ReplicaSets unless orchestration is needed],
    ),
    (
      [HorizontalPodAutoscaler (HPA)],
      [Auto-scales pod replica count based on metrics (CPU/memory via Metrics Server, custom or external); configured with ```bash minReplicas```/```bash maxReplicas```/```bash targetMetric```
        #cmd(
          ```bash kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10", "Enable HPA on a Deployment```,
        )
      ],
    ),
  )

  == kubectl Usage Patterns

  #compare-table(
    ([], [Imperative], [Declarative]),
    (
      [*Approach*],
      [Create/modify resources directly via CLI commands and flags],
      [Write manifest files, apply them with ```bash kubectl```],
    ),
    ([*Control*], [Less control], [Much more control]),
    ([*Recommendation*], [Not recommended as primary workflow], [Recommended way to work with ```bash kubectl```]),
  )

  - Create new resources: #cmd(```bash kubectl create -f nginx.yaml```)
  - Push settings from a new manifest: #cmd(```bash kubectl replace -f nginx.yaml```)
  - Apply settings from a manifest: #cmd(```bash kubectl apply -f nginx.yaml```)
  - Generate YAML quickly: #cmd(```bash kubectl get pods <name> -o yaml --dry-run=client > file.yaml```)
    - (then clean up status/fields)
  - Inspect a running pod: #cmd(```bash kubectl exec -it <pod> -- sh```)

  == Managing Deployments & Rolling Updates

  #def("Rolling Update")[
    The Deployment's task is to ensure enough Pods are always running during an update.
    The new version is deployed and, once confirmed successful, the old version is taken offline.
  ]

  #compare-table(
    ("Strategy", "Behavior", "When to use"),
    (
      "Recreate",
      "All Pods killed, then new Pods created — causes temporary unavailability",
      "Versions cannot run side by side simultaneously",
    ),
    (
      "RollingUpdate",
      "Pods replaced one at a time to guarantee availability — the preferred approach",
      "Default choice; tunable via maxUnavailable / maxSurge",
    ),
  )

  #important[
    *RollingUpdate* options control rollout behavior precisely:
    - `maxUnavailable`: max number of Pods that can be unavailable at the same time during the update
    - `maxSurge`: max number of Pods allowed to run *above* the desired replica count during the rollout, to preserve minimum availability
  ]
  Get details about recent transactions :
  #cmd(```bash kubectl rollout history deployment app-xy-deployment```)

  Undo a previous change:
  #cmd(```bash kubectl rollout undo deployment app-xy-deployment```)
  == Namespaces & Resource Management

  #def("Namespaces")[
    Logical isolation within one cluster. Allows Resource Organization of Group related objects (pods, services, configs) and Access Control, enforce RBAC policies per namespace.

    Default namespaces: *default*, *kube-system*, *kube-public*, *kube-node-lease*
  ]

  #compare-table(
    ([], [Kubernetes Namespaces], [Linux Namespaces]),
    ([*Level*], [Orchestration layer (virtual/logical grouping)], [Kernel-level primitive]),
    ([*Provides*], [Logical isolation within a single cluster], [Actual OS isolation (PID, network, mount, etc.)]),
    (
      [*Scope*],
      [Namespaced resources (Pods, Services) isolated by default; cluster-wide resources (Nodes, PersistentVolumes) shared],
      [Per-process/container isolation enforced by the kernel],
    ),
  )

  === Resource governance
  - *Requests* = guaranteed minimum for scheduling
  - *Limits* = hard cap (throttling for CPU, eviction for memory)
  - *LimitRange* = enforces default min/max per namespace
  - *ResourceQuota* = caps aggregate consumption per namespace

  #important("Always define both requests and limits to ensure fair sharing and stability.")

  == Managing Scheduling

  #def("Scheduling")[
    Scheduling makes sure that Pods are matched to Nodes so that kubelet can run them.
    - The kube-scheduler determines which nodes will run a Pod
    - Different labels can be used to influence where a node will be scheduled
    - Other options can also be used to influence Pod scheduling
      - *nodeName* in the Pod spec: verify which node the Pod should run
      - *nodeSelector* in labels: specify how to run a Pod
      - *affinity*, *antiAffinity* or *taints*
  ]

  === Filtering
  Eliminates infeasible nodes.

  Different options are used to check if a node is eligible to run the Pod:
  - *PodFitsHostPorts*: checks if free network ports are available
  - *PodFitsResources*: checks if the node has sufficient CPU and Memory resources
  - *PodMatchNodeSelector*: checks if the Pod Node Selector matches the Node labels
  - *CheckNodeDiskPressure*: checks if a node is reporting a filesystem that is almost full, so that the Pod won't be scheduled there
  - *CheckVolumeBinding*: Evaluate if the volumes that are requested can be serviced by the node using bound and unbound PVCs

  === Scoring
  After filtering out nodes, scoring is used to evaluate remaining nodes:
  - *SelectorSpreadPriority*: spreads Pods across hosts, considering Pods that belong to the same Service, StatefulSet or ReplicaSe
  - *LeastRequestedPriority*: prioritizes nodes with fewer requested resources
  - *NodeAffinityPriority*: prioritizes nodes according to node affinity scheduling preferences
  - Others

  #pagebreak()
  === Taints and Tolerations
  *Taints* (on Nodes) repel Pods unless the Pod has a matching *toleration*:
  - *NoSchedule* — blocks new Pods
  - *PreferNoSchedule* — avoids scheduling unless no alternative
  - *NoExecute* — evicts existing Pods too
  If a Pod has a toleration, it will ignore the taint

  #important("Taints and tolerations have no effect on DaemonSets")

  ```bash kubectl cordon``` / ```bash kubectl uncordon``` — stop new scheduling on a node without evicting existing Pods.

  == Networking

  #def("Services")[
    Provide stable networking/load balancing for ephemeral Pods via label selectors and a virtual ClusterIP; integrate with readiness probes; support session affinity and traffic subsetting (e.g., blue/green).

    #compare-table(
      ([Type], [Behavior]),
      ([*ClusterIP*], [Internal-only access within the cluster (default)]),
      ([*NodePort*], [Exposes service on each node's IP at a static port]),
      ([*LoadBalancer*], [Exposes externally using cloud provider's load balancer]),
      ([*ExternalName*], [Maps service to external DNS name]),
    )
  ]

  === Accessing Pods
  #def("Ingress")[
    Manage external access to services (HTTP/HTTPS).A single entry point for multiple services.

    Components:
    - *Ingress Resource*: Defines routing rules
    - *Ingress Controller*: Implements the rules (Nginx, Traefik, etc.)
    #comparison(
      "Features",
      "Limitations",
      comp1: (
        "Host-based routing",
        "Path-based routing",
        "SSL/TLS termination",
        "Load balancing across backend services",
      ),
      comp2: (
        "Limited to L7 HTTP/HTTPS traffic",
        "Custom implementations vary by controller",
        "Less flexible for advanced traffic management
",
      ),
    )
  ]

  #def("GatewayAPI (modern replacement for Ingress)")[
    Next-generation API for service networking, more expressive and flexible than Ingress.

    Resources:
    - *Gateway*: Defines the entry point
    - *HTTPRoute*: Specifies how to route HTTP traffic to services
    - *TLSRoute*: Specifies how to route HTTPS traffic to services

    #comparison(
      "Advantages",
      "Best Practices",
      comp1: (
        "Standardized across vendors",
        "Supports multiple protocols (TCP, UDP, gRPC)",
        "Fine-grained traffic control (weighting, retries, timeouts)",
        "Better separation of concerns",
      ),
      comp2: (
        "Use Gateway API for new projects",
        "Stick with Ingress for legacy compatibility",
        "Combine with Service Mesh for advanced needs
",
      ),
    )
  ]

  == Storage
  #important("Container filesystems are ephemeral — die with the container.")

  #def("Volumes")[
    Used to allocate storage that survives a container and stays available during Pod lifetime. They can directly bind to a specific storage type (NFS)

    - At its core, a volume is just a directory, which is accessible to the containers in a Pod
    - Kubernetes supports several types of volume backends
  ]

  - A *Persistent Volume* defines access to external storage available in a specific cluster
  - *Persistent Volume Claims* (PVC), decouple a Pod from a specific PV. It searches for a matching PV, if none exists, a *StorageClass* dynamically provisions one

  #figure(
    image("resources/pod_pvc_pv_storageclass_flow.svg", width: 80%),
    caption: [Kubernetes PVC-PV Flow],
  )

  == ConfigMaps and Secrets

  #compare-table(
    ([], [ConfigMap], [Secret]),
    ([*Purpose*], [Non-sensitive key-value config], [Sensitive data (passwords, tokens, keys)]),
    ([*Encoding*], [Plain], [Base64-encoded by default (not encrypted at rest by default)]),
    ([*Scope*], [Namespace-scoped], [Namespace-scoped]),
    ([*Usage*], [Env vars, mounted files, CLI args], [Env vars, mounted files, private image pulls]),
    ([*Types*], [-], [Opaque, Docker registry creds, TLS certs, service account tokens]),
    (
      [*Best practice*],
      [Version-control alongside manifests],
      [
        - Enable etcd encryption at rest
        - Use External secret managers for production
        - Never commit to version control
        - Limit Access with RBAC policies
      ],
    ),
  )
  #important("Secrets are not truly secret without encryption at rest")

  == Probes

  #def("Probes")[
    Used to test access to Pods and are part of the Pod specification. The probe itself is a simple test, which is often a command.

    Probe types defined in ```bash pod.spec.containers```:
    - *exec*: a command is executed and returns a zero exit value
    - *httpGet*: an HTTP request returns a response code between 200 and 399
    - *tcpSocket*: connectivity to a TCP socket (available port) is successful
  ]

  #compare-table(
    ([Probe], [Purpose]),
    ([*readinessProbe*], [Gates whether a Pod is marked available for traffic]),
    ([*livenessProbe* ], [Continuously checks Pod health, can trigger restarts]),
    ([*startupProbe* ], [For legacy apps needing longer init time (rarely used)]),
  )

  #takeaways((
    [Kubernetes objects are a record of intent — controllers continuously work to bring current state in line with desired state],
    [Always prefer Deployments over bare ReplicaSets unless you need custom update orchestration],
    [Declarative ```bash kubectl apply``` is the recommended way to manage objects — it gives more control than imperative CLI commands],
    [RollingUpdate is the preferred update strategy over Recreate, since it avoids downtime by replacing Pods incrementally],
    [```bash maxUnavailable``` and ```bash maxSurge``` are the two levers that tune how aggressive or cautious a rolling update is],
    [Kubernetes namespaces are a logical/orchestration-layer construct, distinct from Linux kernel namespaces],
    [Resource requests guarantee scheduling minimums, while limits cap usage and trigger throttling (CPU) or eviction (memory)],
    [The scheduler places Pods in two phases — filtering out infeasible nodes, then scoring the rest to pick the best fit],
    [Taints repel Pods unless a matching toleration is present],
    [Services give ephemeral Pods a stable network identity via label selectors and a virtual ClusterIP],
    [Gateway API is the modern successor to Ingress, but Ingress remains relevant for legacy compatibility],
    [Volumes solve the problem of ephemeral container storage; PVCs decouple Pods from specific storage, and StorageClasses provision dynamically when no PV matches],
    [Secrets are base64-encoded, not encrypted, by default — they require explicit etcd encryption at rest to be genuinely secret],
    [Readiness, liveness, and startup probes each answer a different question about Pod health, using exec, httpGet, or tcpSocket checks],
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

  == Helm

  #def("Helm")[
    Helm is a package manager for Kubernetes that simplifies application deployment and management. Instead of manually creating and maintaining dozens of separate configuration files, Helm bundles everything needed for an application into a single, reusable package called a Helm chart.
  ]

  === Core Concepts

  #compare-table(
    ([Term], [Meaning]),
    ([*Chart*], [Collection of files describing related K8s resources (like a .deb/.rpm)]),
    ([*Release*], [Running instance of a chart (e.g., my-app-v1)]),
    ([*Repository*], [Place where charts are stored/versioned]),
    ([*Template Engine*], [Go templates used to inject variables into YAML]),
    ([*Values*], [Externalized configuration passed into templates]),
  )

  #note()[
    *Release states* (via `helm status`): `deployed` · `failed` · `superseded` · `uninstalling` · `uninstalled` · `pending-install` · `pending-upgrade` · `pending-rollback` · `unknown`
  ]

  === Helm Charts

  A chart is a collection of files describing related K8s resources

  #cmd[
    ```bash
    mychart/
    ├── Chart.yaml          ← chart description (metadata)
    ├── values.yaml          ← default values used in chart
    ├── charts/              ← dependency charts go here
    ├── templates/
    │   ├── _helpers.tpl     ← helper functions (not rendered directly)
    │   ├── deployment.yaml
    │   ├── service.yaml
    │   ├── ingress.yaml
    │   ├── hpa.yaml
    │   ├── serviceaccount.yaml
    │   ├── NOTES.txt        ← printed to the user after install
    │   └── tests/
    └── .helmignore
    ```
  ]

  #pagebreak()

  Required fields in a ```bash Chart.yaml```:

  #compare-table(
    ([Field], [Meaning]),
    (
      [*apiVersion*],
      [Chart API version — `v2` for Helm 3 / Helm 3 features, `v1` for older or backwards-compat charts],
    ),
    ([*name*], [Name of the chart]),
    ([*version*], [SemVer 2 version of the chart itself; must match the version in the package filename]),
  )

  #important(
    "Every chart must have a version, and it must follow MAJOR.MINOR.PATCH:
                        - MAJOR — incompatible API changes
                        - MINOR — backwards-compatible new functionality
                        - PATCH — backwards-compatible bug fixes
                        - Pre-release/build metadata labels are allowed as extensions to that format
",
  )

  *Dependencies*:
  - Stored physically in the chart's charts/ directory
  - Helm v3: declared in a dependencies: block inside Chart.yaml itself
  - Each dependency entry has:
  #compare-table(
    ([Field], [Meaning]),
    ([*name*], [Must match the name in the dependency chart's own Chart.yaml]),
    ([*version*], [Semantic version or a version range]),
    ([*repository*], [URL or local path to where that chart lives]),
  )

  #cmd[
    ```bash
    # remote
    dependencies:
      - name: nginx
        version: "1.1.1"
        repository: "https://repo.com/charts"

    # local
    dependencies:
      - name: nginx
        version: "1.1.1"
        repository: "file://../other-charts/nginx"
    ```
  ]

  #cmd[
    ```bash
    helm dependency build    # rebuild charts/ from the lock file
    helm dependency list     # show declared dependencies
    helm dependency update   # download deps (from Chart.yaml or requirements.yaml) into charts/ository: "file://../other-charts/nginx"
    ```
  ]


  === Templates
  A Helm template is a YAML file with placeholders. Helm fills in the placeholders using values, then hands kubectl a normal manifest. It's built on Go's text/template engine — not a YAML-native templating system. It supports general-purpose logic (conditionals, loops, variables)

  #cmd[
    ```bash
    {{ .Values.replicaCount }}   →  Helm fills this in  →  replicas: 3
    ```
  ]

  *Objects*
  #compare-table(
    ([Object], [What it gives you]),
    ([*.Values*], [Values from values.yaml or other specific files - empty by default]),
    ([*.Release*], [Describes the release itself]),
    ([*.Chart*], [Everything accessible from Chart.yaml - example: {{ Chart.Name }}]),
  )

  *Functions*
  #cmd[
    ```bash
    {{ .Values.name | upper | quote }}
    ```
  ]
  Take the value → uppercase it → put quotes around it

  *Logic*
  - *if/else* → include something only if a condition is true
  - *range* → loop over a list
  - *with* → temporarily say "now . means this specific value" so you don't have to keep retyping the full path

  === Helm lifecycle commands

  #cmd[
    ```bash
    helm create <name>         # scaffold a chart
    helm install <release> <chart>     # deploy
    helm upgrade <release> <chart> --set ...  # update
    helm rollback <release> <revision> # revert (use helm history to find revision #)
    helm uninstall <release>   # remove resources + history
    helm list                  # show releases
    helm status <release>      # deployment time, namespace, state, resources
    helm history <release>     # revision list
    helm search repo           # find charts
    helm template <chart>      # render locally without installing
    helm get manifest <release>        # download rendered YAML
    helm install --dry-run --debug     # simulate install, verbose
    ```
  ]

  #stage(
    number: 1,
    name: "Install",
    activities: (
      [`helm install <release> <chart>` deploys the chart as a new release],
      [Optionally test first: `--dry-run --debug` simulates without applying],
    ),
    tools: ("helm install", "helm template"),
  )

  #stage(
    number: 2,
    name: "Upgrade",
    activities: (
      [`helm upgrade <release> <chart>` updates an existing release],
      [`--set` overrides specific chart values at upgrade time],
    ),
    tools: ("helm upgrade",),
  )

  #stage(
    number: 3,
    name: "Rollback",
    activities: (
      [`helm history <release>` lists past revision numbers],
      [`helm rollback <release> <revision>` reverts to a prior revision],
    ),
    tools: ("helm history", "helm rollback"),
  )

  #stage(
    number: 4,
    name: "Uninstall",
    activities: (
      [`helm uninstall <release>` removes all resources from the last release],
      [Release history is also removed by default],
    ),
    tools: ("helm uninstall",),
  )

  == Kustomize

  #def("Kustomize")[
    Kustomize is a tool for customizing Kubernetes configurations. It takes plain K8s YAML you already have and layers changes on top of it declaratively, via kustomization.yaml
  ]

  - *Base* = what's common across all variants
  - *Overlay* = the differences for one specific variant (e.g. dev, prod)
  - Output is a "variant" — pure rendered YAML
  - Build per environment: kustomize build overlays/prod

  Example directory layout:
  #cmd[
    ```bash
    ~/someApp
    ├── base/
    │   ├── deployment.yaml
    │   ├── kustomization.yaml
    │   └── service.yaml
    └── overlays/
        ├── development/
        │   ├── cpu_count.yaml
        │   ├── kustomization.yaml
        │   └── replica_count.yaml
        └── production/
            ├── cpu_count.yaml
            ├── kustomization.yaml
            └── replica_count.yaml
    ```
  ]

  #pagebreak()
  Kustomize commands:

  #cmd[
    ```bash
    kustomize create --resources <file>   # scaffold kustomization.yaml
    kustomize edit                        # modify kustomization.yaml programmatically
                                           #   (add resource, set image, add label, remove resource)
    kustomize build <dir>                 # render final manifest (often piped to kubectl apply -f -)
    kustomize cfg fmt <dir>               # format for consistency
    kustomize localize <dir>              # bundle remote (URL/Git) resources locally for offline use
    ```
  ]

  #def("Transformers")[
    Built-in functions that "transform" your manifests using simple declarative rules. You declare what you want changed in kustomization.yaml; Kustomize applies it.

    #cmd[
      ```bash
      apiVersion: kustomize.config.k8s.io/v1beta1
      kind: Kustomization
      metadata:
        name: demo

      resources:
        - base/nginx-app.yaml

      labels:
        - includeSelectors: true
          pairs:
            app.kubernetes.io/name: hello

      namespace: cldop

      commonAnnotations:
        version: 1.0.0

      namePrefix: kustom-
      nameSuffix: -v1
      ```
    ]

    You can: add labels, set a namespace, add annotations, and prefix/suffix every resource name — all without touching the original manifests
  ]

  #def("Patches")[
    A patch is a partial spec — it doesn't redefine a whole resource, just describes what one section should look like after the change.
    - It can either *replace* an existing value or *append* to a list; which one happens depends on the patch operation (op:) used
    - Kustomize needs enough info (target: kind/name) to know exactly which resource/field you're patching, otherwise it can't apply it correctly.

    Example — renaming a Service via patch:

    #cmd[
      ```bash
      patches:
      - patch: |-
          - op: replace
            path: /metadata/name
            value: nginx-server
        target:
          kind: Service
          name: nginx-app
      ```
    ]

    Result: nginx-app → kustom-nginx-server-v1 (the patch rename plus the namePrefix/nameSuffix transformers from the kustomization file both apply).
  ]

  === ConfigMaps/Secrets in Kustomize

  #compare-table(
    ([], [Option 1: Traditional Model], [Option 2: Generator Mode]),
    (
      [*Definition*],
      [Plain ConfigMap/Secret YAML, included via resources:],
      [configMapGenerator / secretGenerator in kustomization.yaml],
    ),
    (
      [*Behavior on change*],
      [Pods' mounted config updates without a rolling update],
      [kustomize build appends a content hash to the name, so referencing Deployments see a changed name → triggers rolling update],
    ),
  )

  Secret generator can build from *literals:* (key=value pairs) or *files:* (e.g. a password.txt), both rendered into a base64-encoded ```bash Secret``` manifest with a hashed name suffix.

  == Comparison & Best Practices

  #compare-table(
    ([Requirement], [Recommended Tool]),
    (
      [Distribute a complex app (DB + App)],
      [*Helm*],
    ),
    (
      [Manage env-specific configs (Dev/Prod)],
      [*Kustomize*],
    ),
    (
      [Avoid learning a new templating language],
      [*Kustomize*],
    ),
    (
      [Consume community charts],
      [*Helm*],
    ),
    (
      [Need loops/conditionals],
      [*Helm*],
    ),
  )

  === Best practices
  - Keep custom resources and their instances in separate packages
  - Keep common values (namespace, metadata) in the base
  - Organize resources by kind (e.g. horizontal-pod-autoscaler.yaml, services.yaml)
  - Follow standard directory structure: bases, patches, overlays

  === Common pitfalls
  - *Helm*: over-complicating templates — keep them simple
  - *Kustomize*: too many nested overlays — flatten the structure
  - *Both*: not pinning image versions
  - *Both*: ignoring state management (Helm release drift / Kustomize drift)
  - *Both*: not validating manifests before applying



  #takeaways((
    [Helm is a package manager that templates and versions releases; Kustomize is an overlay tool that patches plain YAML with no templating language.],
    [A Chart is the packaged unit; a Release is a running instance of that chart in the cluster, and one chart can produce multiple releases.],
    [Kustomize's Base/Overlay pattern keeps common config in the base and environment-specific differences in overlays.],
    [Use Helm for complex multi-component apps, community charts, or when you need loops/conditionals; use Kustomize for environment-specific configs or to avoid learning a templating language.],
    [Editing a traditional ConfigMap doesn't trigger a rolling update, but Kustomize's configMapGenerator/secretGenerator hashes the name on change, which does trigger one.],
    [Common pitfalls include over-complicated Helm templates, deeply nested Kustomize overlays, unpinned image versions, ignored drift, and skipping manifest validation before applying.],
    [The Helm lifecycle follows install → upgrade → rollback (via helm history) → uninstall, with helm status reporting release state independently at any point.],
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

    #compare-table(
      ([Concept], [Role]),
      ([*BPF programs*], [Code logic that runs at kernel hook points]),
      ([*BPF maps*], [Persist state between program invocations (datapath config, observability counters, etc.)]),
    )
  ]

  #def("Cilium")[
    An eBPF-powered Container Network Interface (CNI) for Kubernetes that provides high-performance networking, deep observability, and security enforcement
  ]

  #pagebreak()

  == Cilium Networking
  #def("Kubernetes Network Policy")[
    A declarative, pod-level network firewall abstraction that understands Kubernetes identities (like labels) rather than just IP addresses. The standard, built-in Kubernetes resource for basic L3/L4 policies
  ]

  #def("CiliumNetworkPolicy")[
    A Custom Resource Definition (CRD) that is a superset of the standard policy, adding advanced features like L7 (API-aware) rules and FQDN filtering
  ]

  #figure(
    image("resources/cilium_architecture.png", width: 80%),
    caption: [Cilium Architecture - High-level View],
  )
  *Architecture components*:

  #compare-table(
    ([Concept], [Role]),
    ([*cilium-operator*], [Talks to kube-apiserver and cloud provider APIs / KV store]),
    ([*cilium-cni*], [CNI plugin invoked by kubelet]),
    ([*cilium-agent*], [Per-node daemon, programs eBPF]),
    ([*hubble-export*], [Exports flow data to SIEM/JSON/Grafana/etc.]),
  )

  Cilium does not enforce policy on IP addresses. Pods get a security identity derived from their labels (e.g., role=backend → identity 20). Policy decisions are identity-to-identity, which is why churning pod IPs don't break policies.

  #pagebreak()

  *Feature-by-feature comparison between NetworkPolicy and CiliumNetworkPolicy*:
  #compare-table(
    ([Aspect], [NetworkPolicy], [CiliumNetworkPolicy]),
    ([*Origin*], [Built-in Kubernetes API object], [Cilium Custom Resource Definition (CRD)]),
    ([*API kind*], [`NetworkPolicy`], [`CiliumNetworkPolicy` (CNP)]),
    ([*Layer support*], [L3 / L4 only], [L3 / L4 / L7 (HTTP, gRPC, Kafka, DNS, ...)]),
    ([*Selectors*], [`podSelector`], [`endpointSelector`, incl. `matchExpressions`]),
    ([*CIDR support*], [`ipBlock` (basic)], [`toCIDR` / `fromCIDR`, `toCIDRSet` / `fromCIDRSet`]),
    ([*FQDN / DNS-aware rules*], [Not supported], [`toFQDNs` (requires a DNS proxy rule)]),
    (
      [*Reserved entities*],
      [Not supported],
      [`toEntities`/`fromEntities`: world, cluster, host, remote-node, kube-apiserver],
    ),
    ([*Cluster-wide scope*], [Not supported (namespaced only)], [`CiliumClusterwideNetworkPolicy` variant available]),
    ([*Port ranges*], [Not supported], [`endPort` keyword (Cilium 1.16+)]),
    (
      [*Relationship*],
      [Subset],
      [Superset — includes everything NetworkPolicy can express, plus advanced Cilium features],
    ),
  )

  == Cilium Network Core Concepts

  #def("Declarative Policy")[
    - Allowed connectivity is defined using declarative Kubernetes resources
    - *NetworkPolicy*: built-in K8s abstraction for basic policies
    - *CiliumNetworkPolicy*: Custom Resource Definition (CRD) that is a super-set of NetworkPolicy, includes advanced Cilium features
    - Each network policy resource defines one or more "*rules*
  ]

  #def("Endpoint Selection")[
    - Each policy exists in a namespace, except for cluster-wide network policies
    - Endpoint selectors match pods within that namespace, or cluster-wide
    - A policy matches 0 or more pods in a namespace based on a *label-match*:
      - `podSelector` field in NetworkPolicy
      - `endpointSelector` field in CiliumNetworkPolicy
    - *Subset Match*: pod must have the labels specified in `matchLabels`, but may have other labels as well
    - Each rule is applied to all pods that match
  ]

  #pagebreak()

  #def("Ingress & Egress Rules")[
    - *Ingress Rules*: traffic entering a pod.
    - *Egress Rules*: traffic leaving a pod.
    - Policies may have any combination of ingress & egress rules
    - Enforcement is split by direction and side of the connection:
      - *Pod A Egress Enforcement* — connectivity leaving Pod A
      - *Pod B Ingress Enforcement* — connectivity entering Pod B
      - Same logic applies at the cluster boundary: connectivity *entering the cluster* is enforced at the destination pod's ingress; connectivity *leaving the cluster* is enforced at the source pod's egress.
  ]

  #def("Default Deny Model")[
    - Each rule describes an *allowed* type of connectivity
    - Total allowed connectivity is the *logical OR* of all rules applied to a pod
    - Connectivity not explicitly allowed is *implicitly denied*
  ]
  #def("Automatically Allowed Connections")[
    - Default deny model does *NOT* apply:
      - On ingress for a pod if no ingress rules matches the pod.
      - On egress for a pod if no egress rules matches the pod.
    - *All ingress connectivity from K8s worker nodes is automatically allowed*
      - Avoid unintentional impact on network liveness/readiness probes from kubelet.
      - Allows connectivity from host-network pods. Host-network == trusted.
  ]
  #def("Stateful Connection Tracking")[
    - *Connection reply traffic is automatically allowed*
    - Mechanism:
      - egress enforcement on the initiating side does a conntrack match, the connection is initiated (e.g. TCP: 10.0.0.1:12345 → 1.2.3.4:80)
      - ingress enforcement on the receiving side does its own conntrack match for the connection reply (TCP: 1.2.3.4:80 → 10.0.0.1:12345) and allows it automatically.
  ]

  #def("Policy Layers")[
    L3: Network Endpoints:
    - toEndpoints / fromEndpoints
    - toCIDR / fromCIDR
    - fromCIDRSet / toCIDRSet
    - toFQDN
    L4:
    - toPort / fromPort
    L7:
    - DNS
    - HTTP, gRPC
    - Kafka, Memcached, Cassandra
  ]

  == Policy Definition

  === Policy Layers
  - Within a rule, each layer is logically AND'd with the other layers
  - Unspecified layers are wildcards
  #compare-table(
    ([Pattern], [Meaning]),
    ([L3-only], [matches from frontend, all L4 ports allowed]),
    ([L4-only], [matches all L3 remote endpoints, only port 80/TCP allowed]),
    ([L3 + L4], [matches from frontend AND port 80/TCP — both must hold]),
  )

  #cmd(
    ```bash
    # L3-only (all L4 ports)
    ingress:
    - fromEndpoints:
      - matchLabels:
          role: frontend

    # L4-only (all L3 remote endpoints)
    ingress:
    - toPorts:
      - ports:
        - port: "80"
          protocol: TCP

    # L3 + L4
    ingress:
    - fromEndpoints:
      - matchLabels:
          role: frontend
      toPorts:
      - ports:
        - port: "80"
          protocol: TCP
    ```,
  )

  === Multiple Rules per Policy
  - 2 separate rule list items → logical OR
  - 1 combined rule (fields nested under the same -) → logical AND

  #cmd(
    ```bash
    # 2 Rules (logical OR)
    ingress:
    - fromEndpoints:
      - matchLabels:
          role: frontend
    - toPorts:
      - ports:
        - port: "80"
          protocol: TCP

    # 1 Rule (logical AND)
    ingress:
    - fromEndpoints:
      - matchLabels:
          role: frontend
      toPorts:
      - ports:
        - port: "80"
          protocol: TCP
    ```,
  )

  === Advanced Endpoint Selectors

  #compare-table(
    ([Selector type], [Behavior]),
    (
      [Multi-label Match],
      [Pod must have all labels to match (logical AND) — e.g. `org: empire` AND `class: deathstar`],
    ),
    ([Wildcards], [`endpointSelector: {}` matches all endpoints]),
    (
      [Set-Based Label Selectors],
      [More complex/powerful matching via `matchExpressions` (e.g. `key: k8s-app, operator: NotIn, values: [app1, app2]`)],
    ),
  )

  #cmd(
    ```bash
    # Multi-label Match (AND)
    spec:
      endpointSelector:
        matchLabels:
          org: empire
          class: deathstar

    # Wildcards
    spec:
      endpointSelector: {}

    # Set-Based Label Selectors
    spec:
      endpointSelector:
        matchExpressions:
        - key: k8s-app
          operator: NotIn
          values:
          - app1
          - app2
    ```,
  )

  === toEndpoints/fromEndpoints
  - *Subset match*: pod must have all labels specified in `matchLabels` to be allowed by the rule, but may have additional labels as well
  - Namespaces are the key consideration when matching on labels

  #compare-table(
    ([Binding type], [How it works]),
    (
      [Implicit Local Namespace Binding],
      [Plain `matchLabels` — implicitly scoped to the same namespace as the policy],
    ),
    (
      [Explicit Namespace Binding],
      [Add `k8s:io.kubernetes.pod.namespace:` to `matchLabels` to target a specific other namespace],
    ),
    (
      [Match all endpoints in local namespace],
      [`matchLabels: {}` — wildcard within local namespace],
    ),
    (
      [Wildcarding Namespace],
      [Use `matchExpressions` with `key:` / `operator: ` to match across *any* namespace],
    ),
  )

  #pagebreak()

  #cmd(
    ```bash
    # Implicit Local Namespace Binding
    ingress:
    - fromEndpoints:
      - matchLabels:
          role: frontend
    ```,
  )



  #cmd(
    ```bash
    # Explicit Namespace Binding
    ingress:
    - fromEndpoints:
      - matchLabels:
          role: frontend
          k8s:io.kubernetes.pod.namespace: foo

    # Match all endpoints in local namespace
    ingress:
    - fromEndpoints:
      - matchLabels: {}

    # Wildcarding Namespace
    ingress:
    - fromEndpoints:
      - matchExpressions:
        - key: k8s:io.kubernetes.pod.namespace
          operator: Exists
        - key: app
          operator: In
          values:
          - backend
    ```,
  )

  === toCIDR/fromCIDR and toCIDRSet/fromCIDRSet

  #cmd(
    ```bash
    # toCIDR
    egress:
    - toCIDR:
      - 10.0.0.0/8

    # toCIDRSet (with exception)
    egress:
    - toCIDRSet:
      - cidr: 0.0.0.0/0
        except:
        - 169.254.169.254/32
    ```,
  )

  #important(
    "CIDR and CIDR-based policies apply ONLY to IPs that are outside the cluster. Do not use them to try and match on Pod, Service, or Worker Node IPs.",
  )

  #pagebreak()

  === toFQDNs L3 Policies
  #compare-table(
    ([Mode], [Example]),
    (
      [Exact match],
      [matchName: `"www.domain.net"` — automatically translated from DNS names, similar to toCIDR],
    ),
    ([Pattern match], [`matchPattern: "*.company.com"` — regex-based matching]),
  )

  #cmd(
    ```bash
    egress:
    - toFQDNs:
      - matchName: "www.domain.net"

    egress:
    - toFQDNs:
      - matchPattern: "*.company.com"
    ```,
  )

  #important(
    "Try to avoid using overlapping toFQDNs — especially across multiple policies.",
  )


  === toFQDNs DNS proxy requirement
  - toFQDNs rules can only be applied to pods that also have a DNS proxy rule that intercepts all DNS lookups from that pod
  - For security reasons, this rule should be limited to DNS servers that you trust (cluster-internal, e.g. only to core-dns).

  #cmd(
    ```bash
    toEndpoints:
    - matchLabels:
        io.kubernetes.pod.namespace: kube-system
        k8s-app: kube-dns
      toPorts:
      - ports:
        - port: "53"
          protocol: ANY
        rules:
          dns:
          - matchPattern: "*"
    ```,
  )

  === toEntities/fromEntities + Reserved L3 Identities
  Special reserved identities that correspond to a group of endpoints or notable entities:

  #compare-table(
    ([Entity], [Meaning]),
    ([world], [all endpoints outside the cluster]),
    ([cluster], [all managed pod endpoints]),
    ([host], [the local K8s worker node]),
    ([remote-node], [non-local K8s worker nodes]),
    ([kube-apiserver], [remote nodes which have healthy backends serving the kube-apiserver]),
  )

  #pagebreak()

  #cmd(
    ```bash
    ingress:
    - fromEntities:
      - world

    egress:
    - toEntities:
      - cluster
      - host
      - remote-node
    ```,
  )

  === toPorts

  #compare-table(
    ([Pattern], [Behavior]),
    ([L4-only], [implicitly allows from all L3 entities]),
    ([L3 + L4], [allows only connections that match at both layers]),
  )

  #cmd(
    ```bash
    # L4-only — implicitly allow from all L3 entities
    ingress:
    - toPorts:
      - ports:
        - port: "80"
          protocol: ANY

    # L3 + L4 — match at both layers
    egress:
    - toPorts:
      - ports:
        - port: "80"
          protocol: ANY
      fromEndpoints:
      - matchLabels: {}
    ```,
  )

  === Port Ranges
  - *With Cilium 1.16+*: implementation of the `endPort` keyword, allowing port ranges in CiliumNetworkPolicies and CiliumClusterwideNetworkPolicies.

  #cmd(
    ```bash
    ingress:
    - fromEndpoints:
      - matchLabels:
          app: client
      toPorts:
      - ports:
        - port: "8080"
          endPort: 8082
          protocol: TCP
    ```,
  )

  #pagebreak()

  === L7 Policy Example (HTTP)

  Same L4-only vs. L3+L4 pattern, one layer up — now with an http rule under toPorts:

  #compare-table(
    ([Pattern], [Behavior]),
    ([L4 + L7], [implicitly allows from all L3 entities]),
    ([L3 + L4 + L7], [allows only connections that match at all layers]),
  )

  #cmd(
    ```bash
    # L4 + L7 — implicitly allow from all L3 entities
    ingress:
    - toPorts:
      - ports:
        - port: "80"
          protocol: TCP
        rules:
          http:
          - method: GET
            path: "/path"

    # L3 + L4 + L7 — match at all layers
    egress:
    - fromEndpoints:
      - matchLabels:
          app: frontend
      toPorts:
      - ports:
        - port: "80"
          protocol: TCP
        rules:
          http:
          - method: GET
            path: "/path"
    ```,
  )

  #pagebreak()

  == Common patterns

  === Default Deny Policy
  - Select all endpoints in namespace, specifying only an "empty" rule for ingress + egress
  - Subverts the “automatic allowˮ by ensuring that all endpoints have at least one ingress + egress rule, but doesnʼt permit any traffic.
  - Can be installed by default in a namespace, requiring the app team to add explicit "allow" exceptions.

    #cmd(
      ```bash
      apiVersion: "cilium.io/v2"
      kind: CiliumNetworkPolicy
      metadata:
        name: deny-all
        namespace: my-namespace-xy
      spec:
        description: Block everything
        endpointSelector: {}
        ingress:
        - {}
        egress:
        - {}
      ```,
    )

    #important("This example will even deny namespace internal and traffic toward core-dns/Kubernetes API!")

  *Allow within Namespace*:

  A variant of the pattern above: instead of an empty rule (which permits nothing), use {} as the match value inside fromEndpoints/toEndpoints — this allows all in-namespace traffic while still denying everything else

  #cmd(
    ```bash
    apiVersion: "cilium.io/v2"
    kind: CiliumNetworkPolicy
    metadata:
      name: allow-within-namespace
      namespace: my-namespace-xy
    spec:
      description: Allow NS internal traffic, block everything else
      endpointSelector: {}
      ingress:
      - fromEndpoints:
        - {}
      egress:
      - toEndpoints:
        - {}
    ```,
  )

  #important("This example will deny traffic toward core-dns/Kubernetes API!")

  #pagebreak()

  *Default DNS Proxy Rule*:

  - Before applying a "default deny," it is recommended to apply a DNS proxy rule — per namespace, or as a CiliumClusterwideNetworkPolicy — to allow and observe all DNS lookups.
  - This is the standard fix for the "Careful" warnings on slides 43–44: add this rule first, then layer the deny-all / allow-within-namespace pattern on top.

  #cmd(
    ```bash
    - toEndpoints:
      - matchLabels:
          io.kubernetes.pod.namespace: kube-system
          k8s-app: kube-dns
      toPorts:
      - ports:
        - port: "53"
          protocol: ANY
        rules:
          dns:
          - matchPattern: "*"
    ```,
  )

  === L7 Visibility Policies
  - Provides visibility into API-layer requests, even if no policy is being enforced
  - For L7 policy, an "empty rule" matches any L7 request, resulting in wildcard behavior
  - Visibility policies can be ingress, egress, or both
  - Must remember to also have a rule that allows all traffic on other ports as well — the visibility rule only covers the port it's attached to

  #cmd(
    ```bash
    apiVersion: cilium.io/v2
    kind: CiliumNetworkPolicy
    metadata:
      name: http-ingress-visibility
    spec:
      endpointSelector:
        matchLabels: {}
      ingress:
      - fromEntities:
        - all
        toPorts:
        - ports:
          - port: "80"
            protocol: "TCP"
          rules:
            http:
            - {}
    ```,
  )

  #pagebreak()

  == Getting Started with Cilium Network Policies & Hubble

  #def("Hubble")[
    Cilium's observability layer, built on the same eBPF data the dataplane already collects. Three interfaces onto that data:
    - Hubble UI — service dependency maps, flow filtering, policy viewer
    - Hubble CLI — detailed flow visibility, filtering, JSON output
    - Hubble Metrics — feeds Grafana/Prometheus for ops & application monitoring
  ]

  *The recommended workflow*:
  + Handle network policies as early as possible — not as an afterthought.
  + Build them bottom-up: nodes (optional) → Kubernetes → Cilium → infrastructure components → user workloads.
  + Continuously watch for DROPPED connections via Hubble.
  + Iterate until no false positives remain



  === Common Gotchas

  - Enabling egress enforcement rules, but not also allowing DNS connectivity
  - Creating toFQDNs rules without corresponding DNS proxy rule
  - Creating an FQDN policy for internal k8s services
  - Creating rules based on the label-identity of unmanaged pods.
  - Creating rules to allow connections to pods based on IPs/CIDRs.
    - Use toEndpoints instead
  - Creating rules to allow connections to K8s worker nodes based on IPs.
    - Use toEntities with host and remote-node instead


    #takeaways((
      [eBPF makes the kernel safely programmable],
      [Cilium enforces policy on identity, not IP],
      [`CiliumNetworkPolicy` is a strict superset of `NetworkPolicy`, but adds L7, FQDN, CIDR sets, reserved entities, and cluster-wide scope],
      [Default-deny has two important exceptions: it only applies once some rule exists for that direction and and traffic from worker nodes / host-network pods is always auto-allowed regardless of policy],
      [Within a rule, layers are AND'd; across rules, they're OR'd],
      [Connection replies are automatically allowed via conntrack],
      [CIDR rules only apply outside the cluster],
      [`toFQDNs` needs a DNS proxy rule to function at all],
      [The practical workflow is observe-then-restrict: use Hubble to see real traffic before tightening policy],
    ))
]

// ===========================================================================
// Lecture 8 — Service Mesh
// ===========================================================================
#lecture(
  title: "Service Mesh",
  learning-objectives: (
    "No dedicated \"Learning Objectives\"",
  ),
)[

  #def("Microservices")[
    A style of application architecture where a collection of independent services communicate through lightweight APIs, taking a cloud-native approach so each core function can exist independently.

    - *Pros*: independent deployment, flexibility, scalability, fault isolation, team autonomy
    - *Cons*: operational complexity, distributed system challenges, data consistency, possibly higher resource usage, increased testing overhead
  ]

  Microservices introduce challenges: load balancing/traffic mirroring/rate limiting, fault tolerance, secure communication, observability/debugging. Thats where a service mesh comes to play.

  #def("Service Mesh")[
    A service mesh is a dedicated infrastructure layer within a software application that handles communication between services, handling traffic routing, security, observability, and resiliency while abstracting that complexity away from individual services.

    *Capabilites*:
    - *Traffic Management* (fine-grained routing, traffic splitting)
    - *Resilience* (fault tolerance, automatic retries/fallback)
    - *Security* (encrypted comms, authN, authZ)
    - *Observability* (metrics, logs, tracing)
  ]

  == Core components
  Originally, every app had to implement these features itself. The fix: embed the mesh logic in a sidecar proxy running alongside (not inside) the app — transparently intercepting traffic, no app code changes needed.

  - *Data plane*: lightweight proxies (e.g. Envoy) handling communication, metrics, security enforcement
  - *Control plane*: manages config/policy (e.g. Istiod) and pushes rules to the data plane dynamically

  Sidecars have two major downsides:
  - Invasiveness
    - modifies pod spec
    - redirects in-pod traffic
    - requires pod restarts to upgrade
  - Underutilization of resources
    - every workload needs its own proxy provisioned for worst-case load

  #pagebreak()

  == Sidecarless Service Mesh
  L2–L4 (Ethernet/IP/TCP-UDP) can move into the kernel via eBPF, but L7 (HTTP, gRPC) parsing still requires a userspace proxy. The general approach is to split service mesh functionality into two tiers.

  #compare-table(
    ([Tier], [Functions], [Cost]),
    (
      [*Secure Overlay Layer*],
      [TCP routing, mTLS tunneling, simple authZ, TCP metrics/logging],
      [streamlined, low resource, zero-trust],
    ),
    (
      [*TL7 Processing Layer*],
      [HTTP routing/LB, circuit breaking, rate limiting, fault injection, retries/timeouts, rich authZ, HTTP metrics/tracing],
      [everything above plus this — i.e. strictly more expensive],
    ),
  )

  === Cilium VS Istio Approach

  #compare-table(
    ([], [Istio], [Cilium]),
    ([*L3/L4 layer*], [ztunnel (userspace daemon, 1/node], [eBPF programs (in-kernel, no daemon)]),
    (
      [*L7 layer*],
      [Waypoint proxy (Envoy, 1/namespace, opt-in)],
      [Per-node Envoy (opt-in per flow)],
    ),
    (
      [*L4 traffic touches userspace?*],
      [Yes (ztunnel is still a userspace process)],
      [No — stays in-kernel],
    ),
    (
      [*Node-to-node L4 transport*],
      [Node-to-node L4 transport],
      [Native eBPF-accelerated path],
    ),
  )

  Istio: Split is two distinct components (ztunnel, Waypoint proxy), with two distinct deployment scopes (node vs. namespace), each handling one layer.\
  ztunnel handles mTLS, L4 telemetry, authentication, authorization
  Node-to-node traffic between ztunnels travels over an HTTPS CONNECT tunnel.\
  Waypoint proxy Provides L7 telemetry and authorization policies at the HTTP level.

  Cilium: There's no always-on second proxy hop for L4 traffic. eBPF is the L4 mesh layer,running in-kernel rather than as a sidecar or per-node daemon process.
  Envoy only gets invoked, flow-by-flow, exactly when L7 visibility/policy is actually required.

  == Traffic management / deployment strategies
  In a microservices graph, services call each other extensively, so a single failing service doesn't fail in isolation — its callers start failing too, and their callers after that. This cascading failure pattern is the core risk a service mesh's traffic-management features are designed to contain

  === GAMMA

  The GAMMA Initiative (Gateway API for Mesh Management and Administration) extends the Kubernetes Gateway API — originally built for north/south ingress traffic — to also govern east/west (service-to-service) traffic inside the mesh, via the same HTTPRoute resource. It's increasingly supported across service meshes, and it's the mechanism that makes some of the canary routing below possible (e.g. header-based routing uses HTTPRoute rules under the hood).

  #pagebreak()

  === Rolling Deployment
  Replaces old instances with new ones in batches. Ensures zero downtime and doesn't require a duplicate environment — but both versions coexist temporarily while the rollout is in progress.

  === Recreate / Big-bang Deployment
  Shuts down the entire old version before deploying the new one. Simple, but causes inevitable downtime since there's a gap with nothing running.

  === Canary Deployment
  Releases the new version to a small, select group of users before a full rollout — minimizing blast radius and allowing real-world testing.

  - *With plain Kubernetes Services*: traffic is always split evenly across all pods behind a Service. To get a specific weight (e.g. v1 getting less traffic than v2), you have to create additional pod replicas as a workaround — there's no other way to weight or selectively stop traffic to specific pods.

  - *With a service mesh*: arbitrary traffic weights are possible directly, no extra pods needed.Routing can also be conditioned on headers rather than just weight, letting you target specific test traffic into the canary precisely.

  === Blue/Green Deployment
  The environment running the previous version is kept alive rather than torn down. Traffic is switched all at once (100%/0%) rather than gradually. This allows a fast fallback to the old deployment even after a full switch, and can be combined with canary deployments (e.g. canary first, then a full blue/green cutover once confidence is high).

  === Dark Launching / Shadow Deployment
  Mirrors live traffic to the new version without it affecting the actual user-facing response — the real response still comes from the old version, but the new version processes a copy of the traffic in parallel. This allows silent testing under real load with zero user-facing risk.

  == Security
  *Motivation*: all pods sit on a flat network by default, so anything can talk to anything — service mesh adds access control on top.

  Two policy types:
  - *Authentication policies* — define who can talk to whom (service identity)
  - *Authorization policies* — fine-grained access control via RBAC, can be as granular as HTTP method/path (GET/POST/PATCH/DELETE) per service

  Authentication splits into:
  - *Service-to-service*: mutual TLS (mTLS)
  - *User-to-service*: JWTs, OpenID Connect

  Other security functions: transparent encryption of all inter-service traffic (mTLS / WireGuard / IPSec), automatic certificate/key issuance and rotation.

  #pagebreak()

  #takeaways((
    [Microservices solve scalability/modularity but create distributed-systems problems],
    [A service mesh = data plane (proxies) + control plane (policy distribution)],
    [Sidecars are invasive and resource-inefficient, motivating a sidecarless design],
    [L7 is the one layer that can't be fully pushed into the kernel],
    [Cascading failure is the core risk that traffic-management features defend against],
    [Plain Kubernetes Services can't do weighted or conditional traffic splitting — a service mesh can],
    [All pods sit on a flat network by default, so anything can talk to anything. Necessitating the need for: Authentication, Authorization, Traffic encryption and Certificate/Key rotation],
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
