import { PartialType } from '@nestjs/swagger';
import { CreateSongLyricDto } from './create-song-lyric.dto';

export class UpdateSongLyricDto extends PartialType(CreateSongLyricDto) {}
