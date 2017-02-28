defmodule GuardianPhoenix.Auth do
  alias GuardianPhoenix.{Repo, Account}
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def verify(email, password) do
    account =  Repo.one(Account.find_by_email(email)) # <- Need to define find_by_email
    cond do
      account && checkpw(password, account.password_digest) -> # <- Valid account and password!
        {:ok, account}
      account -> # <- Found account but password didn't match
        {:error, :bad_password}
      true ->
        dummy_checkpw() # <- Fool hackers
        {:error, :not_found}
    end
  end
end
