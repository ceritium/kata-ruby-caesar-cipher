# encoding: utf-8
require 'rspec'

require_relative '../caesar_cipher'

describe 'CaesarCaesarCipher' do
	describe 'encode' do

		it 'caesar_ciphers by offset' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 1
			caesar_cipher.encode('a').should eql 'b'
		end
	
		it 'is a rounded caesar_cipher' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 2
			caesar_cipher.encode('z').should eql 'b'
		end

		it 'lowers capital letters' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 2
			caesar_cipher.encode('A').should eql 'c'
		end

		it 'ignores numbers and symbols' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 2
			caesar_cipher.encode('1').should eql '1'
			caesar_cipher.encode(',').should eql ','
			caesar_cipher.encode('@').should eql '@'
		end

		it 'can caesar_cipher several letters together' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 1
			caesar_cipher.encode('ABC').should eql 'bcd'
		end

		it 'can caesar_cipher any text' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 3
			caesar_cipher.encode('Any text form by several words!').should eql 'dqb whaw irup eb vhyhudo zrugv!'
		end

	end

	describe 'decode' do
		it 'caesar_ciphers by offset' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 1
			caesar_cipher.decode('b').should eql 'a'
		end
	
		it 'is a rounded caesar_cipher' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 2
			caesar_cipher.decode('b').should eql 'z'
		end

		it 'lowers capital letters' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 2
			caesar_cipher.decode('C').should eql 'a'
		end

		it 'ignores numbers and symbols' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 2
			caesar_cipher.decode('1').should eql '1'
			caesar_cipher.decode(',').should eql ','
			caesar_cipher.decode('@').should eql '@'
		end

		it 'can decode several letters together' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 1
			caesar_cipher.decode('BCD').should eql 'abc'
		end

		it 'can decode any text' do
			caesar_cipher = CaesarCipher.new
			caesar_cipher.offset = 3
			caesar_cipher.decode('dqb whaw irup eb vhyhudo zrugv!').should eql 'any text form by several words!'
		end
	end
end

describe 'Acceptance Test' do
	it 'caesar_ciphers user text' do 
		caesar_cipher = CaesarCipher.new
		caesar_cipher.offset = 3
		caesar_cipher.encode('¿De dónde vengo? ¿A dónde voy? ¿Cuánto tiempo tengo?').should eql '¿gh góqgh yhqjr? ¿d góqgh yrb? ¿fxáqwr wlhpsr whqjr?'
	end
end