import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { SongLyricsService } from './song-lyrics.service';
import { CreateSongLyricDto } from './dto/song-lyrics-query.dto';
import { UpdateSongLyricDto } from './dto/update-song-lyric.dto';

@Controller('song-lyrics')
export class SongLyricsController {
  constructor(private readonly songLyricsService: SongLyricsService) {}

  @Post()
  create(@Body() createSongLyricDto: CreateSongLyricDto) {
    return this.songLyricsService.create(createSongLyricDto);
  }

  @Get()
  findAll() {
    return this.songLyricsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.songLyricsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateSongLyricDto: UpdateSongLyricDto) {
    return this.songLyricsService.update(+id, updateSongLyricDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.songLyricsService.remove(+id);
  }
}
