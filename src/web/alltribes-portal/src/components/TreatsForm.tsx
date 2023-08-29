import classnames from 'clsx'
import type { ChangeEvent, FormEvent } from 'react'
import { useState } from 'react'
import {PostTreat} from "@/api/send-form";

export function TreatsForm({
  className,
  onSubmit,
  submitText = 'Order',
}: {
  className?: string
  onSubmit: (email: string, treat: string, message: string) => Promise<any>
  submitText?: string
}) {
  const [email, setEmail] = useState('')
  const [message, setMessage] = useState('')
  const [treat, setTreat] = useState('')
  const [success, setSuccess] = useState(false)

  // async function handleSubmit(event: FormEvent<HTMLFormElement>) {
  //   event.preventDefault()
  //   const result = await onSubmit(email, treat, message)
  //   console.log(result)
  //   setEmail('')
  //   setMessage('')
  //   setTreat('')
  //   setSuccess(true)
  // }

  function handleChangeEmail(event: ChangeEvent<HTMLInputElement>) {
    setEmail(event.target.value)
  }

  function handleChangeTreat(event: ChangeEvent<HTMLSelectElement>) {
    setTreat(event.target.value)
  }

  function handleChangeMessage(event: ChangeEvent<HTMLInputElement>) {
    setMessage(event.target.value)
  }


  async function submitTreat(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    await PostTreat(email, message, treat)
        .then((value) => console.log("send treat : " + value))

    setEmail('')
    setMessage('')
    setTreat('')
    setSuccess(true)
  }


  return (
    <form
      onSubmit={submitTreat}
      className={classnames('newsletter-form is-revealing md:flex', className)}
    >
      <div className="mr-2 flex-shrink flex-grow">
        <legend>Select your treat 🍺</legend>
        <label className="hidden" htmlFor="email" aria-hidden="true">
          Email
        </label>
        <input
          required
          placeholder="Your best email&hellip;"
          id="email"
          name="email"
          type="email"
          value={email}
          onChange={handleChangeEmail}
          autoComplete="off"
          className="w-full rounded-sm border border-gray-300 bg-white px-4 py-3 my-5 text-sm text-gray-500 shadow-none"
        />
        <select id="treat"
                name="treat"
                value={treat}
                onChange={handleChangeTreat}
                className="w-full rounded-sm border border-gray-300 bg-white px-4 py-3 my-5 text-sm text-gray-500 shadow-none"
        >
          <option value="grapefruit">Grapefruit</option>
          <option value="lime">Lime</option>
          <option value="coconut">Coconut</option>
          <option value="mango">Mango</option>
          <option value="bubble-tea">Bubble tea</option>
          <option value="chouffe">Chouffe</option>
          <option value="cuvee-trolls">Cuvee des trolls</option>
          <option value="ti-punch">ti punch</option>
          <option value="other">Other</option>
        </select>
        <input
            required
            placeholder="Additionnal requirements"
            id="message"
            name="message"
            type="text"
            value={message}
            onChange={handleChangeMessage}
            autoComplete="off"
            className="w-full rounded-sm border border-gray-300 bg-white px-4 py-3 my-5 text-sm text-gray-500 shadow-none"
        />
        {success && (
          <div className="mt-2 text-xs italic text-gray-500">
            Order submitted successfully!
          </div>
        )}
        <div className="control">
          <button
              className="-mt-px inline-flex cursor-pointer justify-center whitespace-nowrap rounded-sm border-0 bg-gradient-to-r from-secondary-500 to-secondary-400 py-4 px-7 text-center font-medium leading-4 text-white no-underline shadow-lg"
              onSubmit={submitTreat}
              type="submit"
          >
            {submitText}
          </button>
        </div>
      </div>


    </form>
  )
}