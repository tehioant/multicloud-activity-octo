import image from "../assets/Sigle_OCTO_marine.png";

export function Logo({ className }: { className?: string }) {
  return (
    <img
      className={className}
      width="32"
      height="32"
      src={image}
      alt={"#"}>
    </img>
  )
}