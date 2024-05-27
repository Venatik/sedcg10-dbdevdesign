import { Module } from '@nestjs/common';
import { SongLyricsService } from './song-lyrics.service';
import { SongLyricsController } from './song-lyrics.controller';
import { SongLyrics } from './entities/song-lyrics.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([SongLyrics])],
  controllers: [SongLyricsController],
  providers: [SongLyricsService],
})
export class SongLyricsModule {}
