---
layout: post
title: "Kubernetes in Production: 5 Hard Lessons Learned"
date: 2024-02-15
tags: [kubernetes, devops, production]
excerpt: "Kubernetes solves real problems but creates new challenges. Learn key lessons about networking, observability, resource management, stateful workloads, and cost control."
---

## The Reality Behind the Hype

Kubernetes promises orchestration, automatic scaling, and resilience. In practice, it's more nuanced. After running production Kubernetes clusters at scale, I've learned that K8s solves real problems—but it creates new ones.

## Lesson 1: Networking is Complex

A simple HTTP request in a monolith becomes a maze of services, DNS, load balancers, and network policies in Kubernetes.

Problems we encountered:
- DNS caching causing stale service discovery
- Network policies blocking legitimate traffic during deployments
- CNI plugin overhead impacting latency-sensitive services

**Solution**: Deep networking knowledge is non-negotiable. Understand your CNI plugin. Test network partition scenarios.

## Lesson 2: Observability Must Come First

Running Kubernetes without observability is operating blind.

You need:
- **Metrics**: Pod CPU, memory, network I/O
- **Logs**: Centralized, searchable, queryable
- **Traces**: Request flows across services

We shipped without proper logging and paid the price debugging production incidents. Months of engineering time later, we built it right.

## Lesson 3: Resource Requests/Limits are Critical

Kubernetes schedules based on declared resource requests. Get these wrong, and you get cascading failures.

- **Too low**: Pods get evicted, throttled, or killed
- **Too high**: Cluster utilization plummets, costs spiral
- **No limits**: Noisy neighbors kill your neighbors

Spend time profiling. Use actual production data. Adjust quarterly.

## Lesson 4: StatefulSets are Hard

Truly managing stateful workloads (databases, queues) in Kubernetes is complex. We initially tried running PostgreSQL in K8s.

Lesson learned: Use managed services. Cloud-native databases (RDS, CloudSQL) are worth the cost for production workloads.

## Lesson 5: Cost Control is Constant Work

Kubernetes's flexibility enables waste. Without active management:
- Abandoned namespaces consuming resources
- Forgotten load balancers costing money
- Resource over-provisioning "just in case"

Implement guardrails: resource quotas, spending alerts, regular audits.

## Conclusion

Kubernetes is powerful. It scales, it heals, it orchestrates. But it demands operational maturity in return. Start small. Automate everything. Measure obsessively.

The clusters that run smoothly aren't the ones with the fanciest Helm charts—they're the ones with the strongest operational discipline.
