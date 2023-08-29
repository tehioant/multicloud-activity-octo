import { Article, ArticleContent, ArticleMedia } from '@/components/article'
import { Layout } from '@/components/layout'

export default function AboutPage() {
  return (
    <Layout>
      <Article>
        <ArticleContent title="About">
          {/* prettier-ignore */}
          <p>
            This portal was developed by <a href="https://github.com/tehioant/">@tehioant</a>
          </p>
          <p>
            This portal is part of a multicloud architecture between Octo's cloud provider tribes.
          </p>
          <p>This template is distributed under the MIT License.</p>
        </ArticleContent>

        <ArticleMedia>
          <img
            alt="Lorem Picsum"
            className="mx-auto lg:aspect-[5/7] lg:w-full"
            width="420"
            height="640"
            src="https://picsum.photos/420/640?grayscale"
          />
        </ArticleMedia>
      </Article>
    </Layout>
  )
}