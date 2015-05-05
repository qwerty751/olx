package Model::Utilitis::MailSend;
	
	use strict;
	use warnings;
	
  
	use Mail::Send;

	my $msg = Mail::Send->new;
	$msg = Mail::Send->new(Subject => 'example', To => 'userTest');
	
	sub new
	{
		my $class = ref($_[0])||$_[0];
		return bless({  },$class);
	}
	
	sub mailSend{
		my ($self, $mailUser,$mailToUser, $message, $header, $fh) = @_;
		if($mailToUser ne "" && $mailUser ne "" && $message ne ""){
			#$msg->to('user@host');
			$msg->to('localhost', $mailToUser);
			$msg->from($mailUser);
			$msg->subject('Test');
			#$msg->cc('user@host');
			#$msg->bcc('someone@else');
			
			
			$msg->set($header, $message);
			$msg->add($header, $message);
			$msg->delete($header);

		    

			$fh = $msg->open;   # some default mailer
			$fh = $msg->open('sendmail'); # explicit
			print $fh "Body of message";
			$fh->close          # complete the message and send it
			or die "couldn't send whole message: $!\n";
		}
	}


	use Email::MIME::MIME;
	sub sendMail{
		my {$self, $mailTo, $mailFrom, $subject} = @_;
		my $message = Email::MIME->create(
			header_str => [
				From    => $mailFrom,
				To      => $mailTo,
				Subject => $subject,
			],
			attributes => {
				encoding => 'quoted-printable',
				charset  => 'ISO-8859-1',
			},
			body_str => "Happy birthday to you!\n",
	);

	# send the message
	use Email::Sender::Simple qw(sendmail);
	sendmail($message);
	}
	
	
1;		
