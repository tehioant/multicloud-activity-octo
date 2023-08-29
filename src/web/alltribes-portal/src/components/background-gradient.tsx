import classnames from 'clsx'
import '../assets/style-octo.css'

export function BackgroundGradient({ className }: { className?: string }) {
  return (
    <div
      className={classnames(
        'bg-octo from-primary-600 to-primary-400',
        className
      )}
    />
  )
}