require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "パスワードリセットのメールを送信" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.reset_password_email(user) }
    before do
      user.generate_reset_password_token!
      mail.deliver_now
    end

    context 'メールを送信した時' do
      it "renders the headers" do
        expect(mail.subject).to eq('パスワードリセット')
        expect(mail.to).to eq([user.email])
        expect(mail.from).to eq(["league_highlight@example.com"])
      end
      
      it "メール本文が正しい" do
        expect(mail.html_part.body.to_s).to have_content("#{user.user_name}様")
        expect(mail.html_part.body.to_s).to have_content('パスワード再発行のご依頼を受け付けました。')
        expect(mail.html_part.body.to_s).to have_content('以下のリンクからパスワードの再発行を行ってください。')
        expect(mail.html_part.body.to_s).to have_content("http://localhost:3001/password_resets/#{user.reset_password_token}/edit")
        expect(mail.text_part.body.to_s).to have_content("#{user.user_name}様")
        expect(mail.text_part.body.to_s).to have_content('パスワード再発行のご依頼を受け付けました。')
        expect(mail.text_part.body.to_s).to have_content('以下のリンクからパスワードの再発行を行ってください。')
        expect(mail.html_part.body.to_s).to have_content("http://localhost:3001/password_resets/#{user.reset_password_token}/edit")

      end
    end
  end
end
