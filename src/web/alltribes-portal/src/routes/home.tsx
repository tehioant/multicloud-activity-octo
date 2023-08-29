import { Hero } from '@/components/hero'
import { Layout } from '@/components/layout'

export default function HomePage() {
  return (
    <Layout>
      <Hero
        title="All tribes PSX - Octo"
        content="Landing page for Tribe day All Tribes PSX. You can add new features. The goal is to deploy a multicloud architecture between AWS, Azure & GCP."
      />
    </Layout>
  )
}