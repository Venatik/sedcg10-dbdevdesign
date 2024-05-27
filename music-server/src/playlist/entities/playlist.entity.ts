import { ApiProperty } from "@nestjs/swagger";
import { Song } from "src/song/entities/song.entity";
import { Entity, PrimaryGeneratedColumn, Column, ManyToMany } from "typeorm";

@Entity()
export class Playlist {
  @PrimaryGeneratedColumn()
  @ApiProperty({
    example: 1,
    description: 'The unique identifier of the playlist',
  })
  id: number;

  @Column({ length: 100 })
  @ApiProperty({
    example: 'Workout Mix',
    description: 'The title of the playlist',
  })
  title: string;

  @ManyToMany(() => Song, (song) => song.playlists)
  @ApiProperty({ type: () => Song, isArray: true })
  songs: Song[];
}
