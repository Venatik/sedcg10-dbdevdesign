import { Injectable } from '@nestjs/common';
import { CreateSongDto } from './dto/song-query.dto';
import { UpdateSongDto } from './dto/update-song.dto';

@Injectable()
export class SongService {
  create(createSongDto: CreateSongDto) {
    return 'This action adds a new song';
  }

  findAll() {
    return `This action returns all song`;
  }

  findOne(id: number) {
    return `This action returns a #${id} song`;
  }

  update(id: number, updateSongDto: UpdateSongDto) {
    return `This action updates a #${id} song`;
  }

  remove(id: number) {
    return `This action removes a #${id} song`;
  }
}
