defmodule Crypto.Test.CaesarTest do
  use ExUnit.Case
  import Crypto.Caesar

  def try_find(cipher) do
    0..26
    |> Enum.map(fn n ->
      {n, decrypt(cipher, n)}
    end)
  end

  test "find p24 caesar plaintext" do
    cipher = "PELCGBTENCUL"
    # cipher |> try_find() |> IO.inspect()
    raw = "cryptography"
    assert raw == decrypt(cipher, 13)
  end

  test "find course" do
    # 《图解密码技术》译者序v页的 凯撒密码-解密
    cipher =
      "ZW PFL NREK KF CVRIE DFIV RSFLK TIPGKFXIRGYP Z IVTFDDVEU RE FECZEV TFLIJV ZEJKILTKVU SP GIFWVJJFI URE SFEVY WIFD JKREWFIU LEZMVIJZKP ALJK JVRITY TIPGKFXIRGYP RK TFLIJVIR.FIX"

    # cipher
    # |> try_find()
    # |> IO.inspect()
    raw =
      "if you want to learn more about cryptography i recommend an online course instructed by professor dan boneh from stanford university just search cryptography at coursera.org"

    assert raw == decrypt(cipher, 17)
  end

  test "caeser encrypt and decrypt" do
    raw = "cat dog"
    cipher = "DBU EPH"
    assert cipher == encrypt(raw, 1)

    assert raw == decrypt(cipher, 1)
  end

  test "encrypt_shift" do
    assert ?B == encrypt_shift(?a, 1)
    assert ?A == encrypt_shift(?z, 1)
    assert ?A == encrypt_shift(?y, 2)
  end

  test "down_then_move_n" do
    assert ?a == decrypt_back_shift(?B, 1)
    assert ?z == decrypt_back_shift(?A, 1)
    assert ?y == decrypt_back_shift(?A, 2)
  end
end
