# Encrypt data with AES 256 ECB PKCS5Padding
class AESCrypt
  CIPHER_ALGORITHOM = 'AES-256-CBC'.freeze
  PASSWORD_CHARACTER_LENGTH = 32
  CIPHER_IV_LENGTH = 16

  class << self
    attr_reader :CIPHER_ALGORITHOM, :PASSWORD_CHARACTER_LENGTH
    def valid_password?(password)
      password.length >= PASSWORD_CHARACTER_LENGTH
    end
  end

  # Initialize AESCrypt wrapper
  # @raise [CipherPasswordTooShortError] min lenght is
  # @return [AESCrypt]
  def initialize(password)
    @password = password[0, PASSWORD_CHARACTER_LENGTH]
    @iv = password[0, CIPHER_IV_LENGTH]
    raise CipherPasswordTooShortError unless valid_password?
    @cipher = OpenSSL::Cipher.new(CIPHER_ALGORITHOM)
  end

  # Encrypt the data using the given password and then return it as Base64
  # string.
  # @param [String]
  # @return [String]
  def encrypt(data)
    enbale_encrypt_mode
    cipher.key = password
    cipher.iv = iv
    Base64.urlsafe_encode64(iv + cipher.update(data) + cipher.final)
  end

  # Decrypt the data using the given password and then return it as Base64
  # string.
  # @param [String]
  # @return [String]
  def decrypt(data)
    enbale_decrypt_mode
    data = Base64.urlsafe_decode64(data)
    cipher.key = password
    cipher.iv = data[0, CIPHER_IV_LENGTH]
    cipher.update(data[CIPHER_IV_LENGTH..-1]) + cipher.final
  end

  # Verify if the password is a valid password for the encryption strategy.
  # @return [boolan]
  def valid_password?
    AESCrypt.valid_password? password
  end

  private

  attr_reader :password, :iv, :cipher

  def enbale_encrypt_mode
    cipher.encrypt
  end

  def enbale_decrypt_mode
    cipher.decrypt
  end
end
