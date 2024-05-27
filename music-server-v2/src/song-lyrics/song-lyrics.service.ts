import { Injectable } from '@nestjs/common';
import { CreateSongLyricDto } from './dto/create-song-lyric.dto';
import { UpdateSongLyricDto } from './dto/update-song-lyric.dto';

@Injectable()
export class SongLyricsService {
  create(createSongLyricDto: CreateSongLyricDto) {
    return 'This action adds a new songLyric';
  }

  findAll() {
    return `This action returns all songLyrics`;
  }

  findOne(id: number) {
    return `This action returns a #${id} songLyric`;
  }

  update(id: number, updateSongLyricDto: UpdateSongLyricDto) {
    return `This action updates a #${id} songLyric`;
  }

  remove(id: number) {
    return `This action removes a #${id} songLyric`;
  }
}
