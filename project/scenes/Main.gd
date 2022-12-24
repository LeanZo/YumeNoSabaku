extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#Play 夢の砂漠
	var yt_dlp := YtDlp.new()
	yield(yt_dlp, "ready")

	yt_dlp.download("https://youtu.be/PSPbY00UZ9w",
			OS.get_user_data_dir(), "audio_clip", true)

	yield(yt_dlp, "download_completed")

	var ogg_file := File.new()
	ogg_file.open("user://audio_clip.ogg", File.READ)

	var stream := AudioStreamOGGVorbis.new()
	stream.data = ogg_file.get_buffer(ogg_file.get_len())

	ogg_file.close()

	$AudioStreamPlayer.stream = stream
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
