-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 281.615265 , 166.641052 , 41.493286 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10364);]] )
   Camera:MotionSpline_AddSplinePoint( 281.615234 , 166.641083 , 41.493229 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10364);]] )
   Camera:MotionSpline_AddSplinePoint( 281.615234 , 166.641083 , 41.493229 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10364);]] )
   Camera:MotionSpline_AddSplinePoint( 281.615234 , 166.641083 , 41.493229 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10364);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
